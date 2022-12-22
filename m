Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B423923AE
	for <chrome-platform@lists.linux.dev>; Thu, 22 Dec 2022 06:40:07 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id c7so567129pfc.12
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 22:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=msi-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogjfcvh43nFxWJnnPvXd6MYBOFhDNuD7/XbMbc0+9WA=;
        b=OqJZAB59ID/EzzKS9/X9ntb8J7R7YMFxMetxuTncgZUdrwhQvJLh4p5Sav2sFoi8mt
         2a1c6MqnDvI+ivAsreUmGbzRrEWS6Ne7xJG1d4A53UebPLmzd1Pa8tDe7GjG8TiezO/6
         RX3ets/SdfR+vVv2p7Q5vty8/r7r0CyOtXGjBMIZ/wAoexF8E+vfKQZBJMeJz1fzC1wf
         kGvBj6KGPPJYgXCpjevDUyjKxYTs3HV1KpbqFkrDI3V52seVMREMtFaYB/or/SXpERhp
         HZV3EIwmeltNCGNYIqRw5p23c4NqBCTzhpornJPeDZrL4xG/buHQYF0X56VXvRUd1/z9
         Z4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogjfcvh43nFxWJnnPvXd6MYBOFhDNuD7/XbMbc0+9WA=;
        b=zi2MXP5Oden9GC6cXgIzbopvGMInOqc4Fz/reCmq7brv23wCQvCX+rUywTFpHAdyOh
         FhdZKJ38JFIHUK9nR1uqzfAJwZrTMA9xn4k56LRfFFzd3mDg7QRIGQClflk82A3ggAYt
         FceZSSs44K0Ljzj2XsZVMiE0rbYybBp+OFP+WRSd0OfzV6x1wHmGIIud8D7iJYHMTxFX
         BxKN6NEcovNHd3dmlNXRGTqFYXAxX9vDkxDT4zHiABmzPvCbHYeXQmf6fGikU37jJFTr
         HHCi/EGv5rC0ny7rWyeHpBnXFc+KbhKFwpSrkNtd9sYhx37vAFzawkGtLOf3OM2bTQYB
         a0/A==
X-Gm-Message-State: AFqh2kr8bWJu1X6rILKJzk0Fm2jNFwpjWn/KNUoEPfOuatK/4R4UEGHP
	tgS12PtgHKSvQcvDXn4X9ajIjg==
X-Google-Smtp-Source: AMrXdXtmMLjak80VM38E7Wd9D1fLmvnMYfL4vab5F34++EowJdAgClZfDHjQ/eCnN7G61+SsEnuk5Q==
X-Received: by 2002:a05:6a00:1485:b0:575:b783:b6b3 with SMTP id v5-20020a056a00148500b00575b783b6b3mr6658062pfu.28.1671691207118;
        Wed, 21 Dec 2022 22:40:07 -0800 (PST)
Received: from localhost.localdomain (211-20-230-25.hinet-ip.hinet.net. [211.20.230.25])
        by smtp.gmail.com with ESMTPSA id q15-20020aa7982f000000b00576f9773c80sm11684539pfl.206.2022.12.21.22.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 22:40:06 -0800 (PST)
From: Joe Wu <joewu@msi.corp-partner.google.com>
X-Google-Original-From: Joe Wu <joewu@msi.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Xiang wangx <wangxiang@cdjrlc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Prashant Malani <pmalani@chromium.org>,
	linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	chrome-platform@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Derek Huang <derekhuang@google.com>,
	"Dustin L . Howett" <dustin@howett.net>,
	Joe Wu <joewu@msi.com>,
	Furquan Shaikh <furquan@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lee Jones <lee.jones@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Subject: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Date: Thu, 22 Dec 2022 14:39:50 +0800
Message-Id: <20221222063950.26018-1-joewu@msi.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

Add 3 extra buttons: 'brightness up', 'brightness down'
and 'screen lock' to support monitor manipulating function.

Signed-off-by: Joe Wu <joewu@msi.com>
---

 drivers/input/keyboard/cros_ec_keyb.c          | 15 +++++++++++++++
 include/linux/platform_data/cros_ec_commands.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
index 6f435125ec03..e7ecfca838df 100644
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
+		.code           = KEY_SCREENLOCK,
+		.bit            = EC_MKBP_SCREEN_LOCK,
+	},
 
 	/* Switches */
 	{
diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 5744a2d746aa..a2073ed43972 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3471,6 +3471,9 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_VOL_UP		1
 #define EC_MKBP_VOL_DOWN	2
 #define EC_MKBP_RECOVERY	3
+#define EC_MKBP_BRI_UP		4
+#define EC_MKBP_BRI_DOWN	5
+#define EC_MKBP_SCREEN_LOCK	6
 
 /* Switches */
 #define EC_MKBP_LID_OPEN	0
-- 
2.17.1

