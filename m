Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B98136D
	for <chrome-platform@lists.linux.dev>; Wed,  7 Dec 2022 09:39:54 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id 140so17053285pfz.6
        for <chrome-platform@lists.linux.dev>; Wed, 07 Dec 2022 01:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uU7abS1OTYc27NQr7ZVRm3zR4ABpJNSar2eydFTH12Y=;
        b=PTqXHd7Ks3woQUeuzU9Ay7/RFKKvJPVd7W3t1q4WIQzjxub0fx2FjtqByohwJUqAD3
         Ve0UqLXdFyfkjH2y6Nx8BdGxCcNFSoP3de79wpMO1Nstz3HMOmd3C9/5fh88Hjc57LIq
         kVzZ1278gcpj6ykXqrAQIcu7AIWOyd1MMWqPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uU7abS1OTYc27NQr7ZVRm3zR4ABpJNSar2eydFTH12Y=;
        b=QZ0kl1zitDWiMTsaWBCRWg+MgIVqIPgP1WUYvAb7FLgrrEAWh6uhZPtXOgozUZfDW5
         QF3su4m9pIARw8VdXjLV21yvqbSn3+RU3zUO+GdJlYchAbaX90XSOr3N3mSWJSzPJkx3
         B08xrMRsdFGzyLQ9QwHy65xTJHyLuqXg1SxOJhqNSK2ofCMu6nydrf20cNCqqCU1WJX/
         G4NwVzCIgWyCMih6r0EwFUeVvxEN94ZSqypJaQtoV6MIV2b8CMdKaOrmz+bUz6vj7WnE
         0oguBY6r2izkpA/08lTmPLQicNuoCWpvlx0hMStcgYjnXdS5L9EtzZwiGMwzewLSlKME
         Rjpg==
X-Gm-Message-State: ANoB5pmqqLLyPTEnKujycU3h0JLN1g2qDtojsKzsWI0NcVH+zuLk0B1n
	724cBYEyK8pvswLrXVt3C7q7Tw==
X-Google-Smtp-Source: AA0mqf6EpBhqPA4rcDA4dGBczoJ4VvMCGAE5Zt75w50qqZX15NMTDur9hpcrJ20ACtyCAPcMRqgh0Q==
X-Received: by 2002:a63:fe16:0:b0:46b:8e9:7d5f with SMTP id p22-20020a63fe16000000b0046b08e97d5fmr65977999pgh.597.1670405993587;
        Wed, 07 Dec 2022 01:39:53 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:bdb7:35b1:b44c:1926])
        by smtp.gmail.com with UTF8SMTPSA id i5-20020a17090332c500b001897de9bae3sm14232908plr.204.2022.12.07.01.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 01:39:53 -0800 (PST)
From: Victor Ding <victording@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: pmalani@chromium.org,
	groeck@chromium.org,
	dustin@howett.net,
	gustavoars@kernel.org,
	gregkh@linuxfoundation.org,
	sebastian.reichel@collabora.com,
	dnojiri@chromium.org,
	lee.jones@linaro.org,
	bleung@chromium.org,
	tinghan.shen@mediatek.com,
	tzungbi@kernel.org,
	Victor Ding <victording@chromium.org>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: [PATCH v2] platform/chrome: cros_ec_typec: zero out stale pointers
Date: Wed,  7 Dec 2022 09:39:40 +0000
Message-Id: <20221207093924.v2.1.I1864b6a7ee98824118b93677868d22d3750f439b@changeid>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`cros_typec_get_switch_handles` allocates four pointers when obtaining
type-c switch handles. These pointers are all freed if failing to obtain
any of them; therefore, pointers in `port` become stale. The stale
pointers eventually cause use-after-free or double free in later code
paths. Zeroing out all pointer fields after freeing to eliminate these
stale pointers.

Fixes: f28adb41dab4 ("platform/chrome: cros_ec_typec: Register Type C switches")
Fixes: 1a8912caba02 ("platform/chrome: cros_ec_typec: Get retimer handle")
Signed-off-by: Victor Ding <victording@chromium.org>
---

Changes in v2:
- Updated commit messages;
- No code changes.

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

