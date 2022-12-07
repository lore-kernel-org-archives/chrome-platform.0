Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D16374
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 04:02:42 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id w15-20020a17090a380f00b0021873113cb4so347435pjb.0
        for <chrome-platform@lists.linux.dev>; Tue, 06 Dec 2022 20:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JpzwpkKCmH2sOx1GakX1P9BwZsMPGRIYnZX6CUK5AeE=;
        b=J54Uj5AVZuhIZz5YmG1N8uxXOjD1eAaOOBsf1S2cy8THrKvt/Hwv5ZvlwgN9Bl8c8l
         M2tnc/0CkBKLeQI7F92o3mfoXHByXC02CjLvw89b2MORerb7QLWjfhtWyz4EA24tY01v
         nvBZwqxii1QUSU8X8s+6i74/3kv5B6PkK4Lrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JpzwpkKCmH2sOx1GakX1P9BwZsMPGRIYnZX6CUK5AeE=;
        b=Yf+paUNUCkHdV/1CBQ2VpfMktE4kycjjWeT8wy12WE3vQvHQPAC6yADNvl4V3IIJoU
         xi4/lovWheZ/BBzgnkWz2RrzvFxiLf9s5a4P9vzAbM8qyA6C7WsL2gNzOSZnLTN3eniT
         +Q0Kq7cT3AaeXYHLrFS7SUOw0wl3bpl27JX2jaCNeEP9MN/hJLruE3o2HQWCJ3Qesh1p
         UAyd/pUJcIOeRRTaeD+qVtaoByS2EbylfWqI9imN4DYtlgINix6Z4fKf39+7rAMw4WtD
         WqtUC2zOWu821MShh/5LC8e76tK9Z90pnodAYYGo0Fqa8pJth7FeRgRTmDiKl8AStS4U
         npuw==
X-Gm-Message-State: ANoB5pklqueaeroWoCJAT3jIISU5n5D6MG2JM0QFUfCF3RcV8Vgh80GN
	ZR+hXcMtTo+bUhqda49Dh7T35A==
X-Google-Smtp-Source: AA0mqf5oRBxRQoJi7SCi44xUMQuWzsGARoZmCn30XHcrfM0wUrUsU4SqnNz4GPGHwV275yEx8fCKwg==
X-Received: by 2002:a17:90a:4a8f:b0:215:f80c:18e6 with SMTP id f15-20020a17090a4a8f00b00215f80c18e6mr104577701pjh.45.1670385762436;
        Tue, 06 Dec 2022 20:02:42 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:bdb7:35b1:b44c:1926])
        by smtp.gmail.com with UTF8SMTPSA id a2-20020a17090abe0200b0020ae09e9724sm143925pjs.53.2022.12.06.20.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 20:02:42 -0800 (PST)
From: Victor Ding <victording@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: tinghan.shen@mediatek.com,
	gustavoars@kernel.org,
	sebastian.reichel@collabora.com,
	dnojiri@chromium.org,
	bleung@chromium.org,
	lee.jones@linaro.org,
	pmalani@chromium.org,
	groeck@chromium.org,
	tzungbi@kernel.org,
	gregkh@linuxfoundation.org,
	dustin@howett.net,
	Victor Ding <victording@chromium.org>
Subject: [PATCH] platform/chrome: cros_ec_typec: zero out stale pointers
Date: Wed,  7 Dec 2022 04:01:08 +0000
Message-Id: <20221207040049.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`cros_typec_get_switch_handles` allocates several pointers when
obtaining four handles. These pointers are all freed if failing to
obtain any of the four handles; therefore, pointers in `port` becomes
stale. The stale pointers eventually cause use-after-free or double in
later code paths.

This patch proposes to elimite these stale pointers by zeroing them out
right after they are freed.

Signed-off-by: Victor Ding <victording@chromium.org>
---

 drivers/platform/chrome/cros_ec_typec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 2a7ff14dc37e..59de4ce01fab 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -173,10 +173,13 @@ static int cros_typec_get_switch_handles(struct cros_typec_port *port,
 
 role_sw_err:
 	typec_switch_put(port->ori_sw);
+	port->ori_sw = NULL;
 ori_sw_err:
 	typec_retimer_put(port->retimer);
+	port->retimer = NULL;
 retimer_sw_err:
 	typec_mux_put(port->mux);
+	port->mux = NULL;
 mux_err:
 	return -ENODEV;
 }
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

