Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F11641
	for <chrome-platform@lists.linux.dev>; Tue,  3 Oct 2023 00:34:35 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690fe10b6a4so259511b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 02 Oct 2023 17:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696293274; x=1696898074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L5aF3XmMYuXB9m+K+yR4UudzmAD6ahXZqfX5b3PlkQE=;
        b=V/Mx1uP5RsRYiKPJq+7py08zs0xr1WJA+wS0AO42BVesHfPuifPZI0PQAQEEinTxGt
         h+8Qh+MG5WWpQTQrZyVa7YfgIUY7+ok6dfKSyxJkzbnn+nxQRnPQru24KD5+zuUw0MYW
         lDTKmWwEZQT+GE6cv929IVjwNzqWiL0ruFQg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696293274; x=1696898074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L5aF3XmMYuXB9m+K+yR4UudzmAD6ahXZqfX5b3PlkQE=;
        b=NhADVtg+DxO36ZdJFQBGrLwIGwfxgaLKIY+1irmCG1ews3Jrsstmglr2iMUlcIW8qi
         MtF5AJX0quyQEWrhRm1o/tfkeYQ1j5p1BYiHlu4UhgUGB2IESOBmkWOmapL9upYzUPnj
         mW+XRAcv9z5hFuN3Ie5dBi1muPbFah/9G3awU97PFhb7qu7CE21bzeM1HQQEs/oG+osU
         5P0G/5qwD5onK2qyFEQ/Bmh7pGHLPI98z707/f11r4oGts+MSkUMrmfFKNBvCH+8RwYk
         R9tOxxE11YVQ9HbMEQs0+/8wvzVWChZq1CfEAl46UaBGjVDwxCRJH1YVCPQFbRdiQniB
         Mcgw==
X-Gm-Message-State: AOJu0YwO+KvHcXE4wnF8CWAjMuKnEx4jrBTLKZZHAUE85suTxfqe0WxN
	1j6xyO/6qkk0uThF/3tk9XY4yw==
X-Google-Smtp-Source: AGHT+IENc/i97QiaKLX8ED7u8WLA/M8LbyfJtn+ap0kJa0WKwfajkcwqigch9jifv0DXhEQbmHsRWg==
X-Received: by 2002:a05:6a00:b87:b0:693:3d55:2ba6 with SMTP id g7-20020a056a000b8700b006933d552ba6mr16207301pfj.9.1696293274608;
        Mon, 02 Oct 2023 17:34:34 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:f676:8db:8677:aefe])
        by smtp.gmail.com with ESMTPSA id bm2-20020a056a00320200b0068a13b0b300sm101368pfb.11.2023.10.02.17.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 17:34:34 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	chrome-platform@lists.linux.dev,
	Prashant Malani <pmalani@chromium.org>
Subject: [PATCH 3/4] platform/chrome: cros_typec_vdm: Mark port_amode_ops const
Date: Mon,  2 Oct 2023 17:34:27 -0700
Message-ID: <20231003003429.1378109-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231003003429.1378109-1-swboyd@chromium.org>
References: <20231003003429.1378109-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark this struct of functions const so it moves to RO memory.

Cc: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_vdm.c | 2 +-
 drivers/platform/chrome/cros_typec_vdm.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/chrome/cros_typec_vdm.c
index 20515ee0a20e..3f632fd35000 100644
--- a/drivers/platform/chrome/cros_typec_vdm.c
+++ b/drivers/platform/chrome/cros_typec_vdm.c
@@ -142,7 +142,7 @@ static int cros_typec_port_amode_vdm(struct typec_altmode *amode, const u32 hdr,
 			   sizeof(req), NULL, 0);
 }
 
-struct typec_altmode_ops port_amode_ops = {
+const struct typec_altmode_ops port_amode_ops = {
 	.enter = cros_typec_port_amode_enter,
 	.vdm = cros_typec_port_amode_vdm,
 };
diff --git a/drivers/platform/chrome/cros_typec_vdm.h b/drivers/platform/chrome/cros_typec_vdm.h
index 95a6a75d32b6..631bd2ce4b00 100644
--- a/drivers/platform/chrome/cros_typec_vdm.h
+++ b/drivers/platform/chrome/cros_typec_vdm.h
@@ -5,7 +5,7 @@
 
 #include <linux/usb/typec_altmode.h>
 
-extern struct typec_altmode_ops port_amode_ops;
+extern const struct typec_altmode_ops port_amode_ops;
 
 void cros_typec_handle_vdm_attention(struct cros_typec_data *typec, int port_num);
 void cros_typec_handle_vdm_response(struct cros_typec_data *typec, int port_num);
-- 
https://chromeos.dev

