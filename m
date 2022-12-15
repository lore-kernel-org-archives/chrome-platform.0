Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C35F20E8
	for <chrome-platform@lists.linux.dev>; Thu, 15 Dec 2022 06:15:57 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 21so6040379pfw.4
        for <chrome-platform@lists.linux.dev>; Wed, 14 Dec 2022 22:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=msi-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oq3Q/v9M0FAAcv8VLfjvpMkPjVB7ciFNfjJzo2R39JA=;
        b=Nb0Tfua7iHs2FKnbAkBK9JzNJN6bQVRvQ/+pXZ/vH64jrmUtv9uadwXIn/sfOOqlNl
         Q+s1X1FtC2vGOk0x5XRecrs89EM3rGNGzvHLDdMaMS7ufvbrvimRydIDNVdd5K+dNiH9
         UNsObvVgYTnfxUVaA0k7lh65UcxJDDAxan6kIBOfR2TDwz3GNDTy/Plo6wIPPGaCh3+P
         X4VewwRQ5tHy/e90IHMSS9T2dC6/4Z7PqhbQCCIw86eHqdbYMJD+xsS4PG4Cc+dNdGfj
         cjVGO6nne6dxWbliUQyXGZS4x5nB2y1jNC0lsKgWNxbDVboWrumD5gAl1kbOV6zdhChh
         4MwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oq3Q/v9M0FAAcv8VLfjvpMkPjVB7ciFNfjJzo2R39JA=;
        b=kinduFEVSlcMOcHHS3iF7kUegR5O/wtfnQER/bOvMVhprfvzSOVTwKzZRXo5BZ9V6z
         ijbAAtiVPSKdVqgDw54kqB4ca6Z9jVXFRySQxAG8s4DQoyhgG3RyjUPXXI6Og4sdhjVl
         sl3NBUN2TfX0LaYV+4OyNzmWihYSxVTslEYd3iKkgaS3Q1XsTIGrJ6aieSBVmFyuO+9U
         m7Uy43uyZdLGDn/i3sBMt5Reiz2T1giSHiU1C3zlGijr4HxUlQHIUPRuFEWHCYQAPAuR
         Q2tXb3fhlvltMvyhKibzEYmimHGvQlRbKB7OjaRzVjEqTOvMceYM8+7sb3BF7hc0jfw3
         ffqQ==
X-Gm-Message-State: ANoB5pm7+RSrIHUxBwA4pv+EP9HnYrlumhAiM0/xtchjmkT3R4+A2SON
	CKvkIxalG+jz4mfEofLwiHAzLg==
X-Google-Smtp-Source: AA0mqf4Tre6vus0as+TQKxU+lOQjbKJDNFZ/xjCFePHJF5Sh1oduDluiMfbz+lXJwzYK3RhRjP4q0A==
X-Received: by 2002:a05:6a00:1a42:b0:572:4ea8:30b9 with SMTP id h2-20020a056a001a4200b005724ea830b9mr34315547pfv.15.1671084956700;
        Wed, 14 Dec 2022 22:15:56 -0800 (PST)
Received: from localhost.localdomain (211-20-230-25.hinet-ip.hinet.net. [211.20.230.25])
        by smtp.gmail.com with ESMTPSA id 125-20020a620483000000b00576670cc16dsm804901pfe.197.2022.12.14.22.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 22:15:56 -0800 (PST)
From: Joe Wu <joewu@msi.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Xiang wangx <wangxiang@cdjrlc.com>,
	linux-input@vger.kernel.org,
	Derek Huang <derekhuang@google.com>,
	Joe Wu <joewu@msi.corp-partner.google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	Furquan Shaikh <furquan@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Douglas Anderson <dianders@chromium.org>,
	"Dustin L . Howett" <dustin@howett.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Date: Thu, 15 Dec 2022 14:15:50 +0800
Message-Id: <20221215061550.18993-1-joewu@msi.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

This patch is to add extra 3 buttons: 'brightness up',
'brightness down' and 'leave PC(cros) mode' to support
monitor navigation function.

Signed-off-by: Joe Wu <joewu@msi.corp-partner.google.com>

---

 drivers/input/keyboard/cros_ec_keyb.c          | 15 +++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index c14136b733a9..bf1cf0b782d2 100644
--- a/drivers/input/keyboard/cros_ec_keyb.c
+++ b/drivers/input/keyboard/cros_ec_keyb.c
@@ -100,6 +100,21 @@ static const struct cros_ec_bs_map cros_ec_keyb_bs[] = {
 		.code		= KEY_VOLUMEDOWN,
 		.bit		= EC_MKBP_VOL_DOWN,
 	},
+	{
+		.ev_type        = EV_KEY,
+		.code           = KEY_BRIGHTNESSUP,
+		.bit            = EC_MKBP_BRI_UP,
+	},
+	{
+		.ev_type        = EV_KEY,
+		.code           = KEY_BRIGHTNESSDOWN,
+		.bit            = EC_MKBP_BRI_DOWN,
+	},
+	{
+		.ev_type        = EV_KEY,
+		.code           = KEY_F13,
+		.bit            = EC_MKBP_CROS_LEAVE,
+	},
 
 	/* Switches */
 	{
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 5744a2d746aa..79218da8a8cb 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3471,6 +3471,9 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_VOL_UP		1
 #define EC_MKBP_VOL_DOWN	2
 #define EC_MKBP_RECOVERY	3
+#define EC_MKBP_BRI_UP          4
+#define EC_MKBP_BRI_DOWN        5
+#define EC_MKBP_CROS_LEAVE      6
 
 /* Switches */
 #define EC_MKBP_LID_OPEN	0
-- 
2.17.1

