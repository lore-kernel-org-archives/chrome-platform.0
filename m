Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E96E15A9
	for <chrome-platform@lists.linux.dev>; Thu, 22 Dec 2022 02:15:51 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so506534pjd.0
        for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 18:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=msi-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pMtoNjAwIQUvGwTR7JCUzDt1hzSa3SUyDledqQ1II4=;
        b=Q6MhEJDaep967D5w2qUF36srj3NDACk7BOk56l1MYh1GvdlnNF8ZEglDBfiEzHfcD+
         POvoaIeId8WV/9ge5PV43ewLIj0fHWx3ad3skDC0iKsfKNExhusKpkVxg1D517njaxGC
         QZenOz+ynDr1WivFV+t+y+/qvvOMQwC/7Mt83tTD/0sgscL/gvI4YsFwRnsqGSkPavPX
         jeszAW+J2ZJT0xdVMCTYS4my5C424Ro5bKj/hC+ybDGcjr4TMNTQeFz1GK1jWZsxL2zn
         tGAyZ/Flili5R2hR6n29S8f3+YbZ5GQvGMDpElIxLGI2nNKnufAIyAg2XyzNKxqVs1al
         n/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5pMtoNjAwIQUvGwTR7JCUzDt1hzSa3SUyDledqQ1II4=;
        b=TM2A7K2HTiOi5OPQRVQLJh3JkCsWdNiKWeTkQyu+itv8esHfF7TUvLNNrrMgPtxlQj
         V2O/nOiQqdx9c0MLNM1uJQv/IIaCgFsyAOZFc7EYccUqBmLQW56bKEsj0hwRryXEb6GZ
         JwntGbpFO1PpbhWcUQCAa8SoAakCs0Rk6WhOHOSrWQ38bffO10JhsqeilNZ3voM+M2s+
         ah+DROAj4A++8m4xLrEYPKUfzUUhRckuZUpdZ2sApHS4V3Ex3Wc4hllJq7UzSa6fssqa
         QghtbgwnU8rHneGp94jrriCCagwz/5zfmy4VvaB/WJnuSwL4E++YmeQf5i8VIHzoPro+
         +Iew==
X-Gm-Message-State: AFqh2kqWuyuwLOdvcngnWLvTsSB6E2DqYETQ6/foX6Mv0h7EOEmhw3WO
	mjOxmqRPq5yHtYcRtKS5rJm/rw==
X-Google-Smtp-Source: AMrXdXsJGC5V725RQYKSvnHp/eZhEhgA5pWxuQtOYcAI4IF4DfDmZZZWuVchRgxyd5FYIcWCw2DFTA==
X-Received: by 2002:a17:902:7d89:b0:190:fe60:48c4 with SMTP id a9-20020a1709027d8900b00190fe6048c4mr19406377plm.21.1671675350984;
        Wed, 21 Dec 2022 18:15:50 -0800 (PST)
Received: from localhost.localdomain (211-20-230-25.hinet-ip.hinet.net. [211.20.230.25])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b00188f07c9eedsm12127824plh.176.2022.12.21.18.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 18:15:50 -0800 (PST)
From: Joe Wu <joewu@msi.corp-partner.google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Furquan Shaikh <furquan@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Benson Leung <bleung@chromium.org>,
	Derek Huang <derekhuang@google.com>,
	"Dustin L . Howett" <dustin@howett.net>,
	Joe Wu <joewu@msi.com>,
	Guenter Roeck <groeck@chromium.org>,
	linux-input@vger.kernel.org,
	Xiang wangx <wangxiang@cdjrlc.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Stephen Boyd <swboyd@chromium.org>,
	Joe Wu <joewu@msi.corp-partner.google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Date: Thu, 22 Dec 2022 10:15:42 +0800
Message-Id: <20221222021542.11706-1-joewu@msi.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>

From: Joe Wu <joewu@msi.com>

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
index 5744a2d746aa..502f0397a402 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -3471,6 +3471,9 @@ struct ec_response_get_next_event_v1 {
 #define EC_MKBP_VOL_UP		1
 #define EC_MKBP_VOL_DOWN	2
 #define EC_MKBP_RECOVERY	3
+#define EC_MKBP_BRI_UP          4
+#define EC_MKBP_BRI_DOWN        5
+#define EC_MKBP_SCREEN_LOCK     6
 
 /* Switches */
 #define EC_MKBP_LID_OPEN	0
-- 
2.17.1

