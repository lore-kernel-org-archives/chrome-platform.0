Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8845A2A
	for <chrome-platform@lists.linux.dev>; Wed, 28 Dec 2022 01:08:19 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id b12so9713312pgj.6
        for <chrome-platform@lists.linux.dev>; Tue, 27 Dec 2022 17:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q3Dq4wWbILHgSzdg9F0HvepnEYOyHWo5P75M1QcLm/s=;
        b=Fgalns0fr/AFzMRxFeH4/LwL0qZbL0snm2KwCCl2QnPyl5Kbj/+4zrKEcmy8PPTNsB
         7FbZ2XYBB4W4MucUlLZY9jZSYs202FFXLnztqFnlw75So6egAqI4XNC2nmCgHZVLhOrE
         1ffKuQRivqF0uBoREPBSAzm5QRibeBZ3I9Yt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q3Dq4wWbILHgSzdg9F0HvepnEYOyHWo5P75M1QcLm/s=;
        b=ScoyJRf+3SQQgcsYrAwyBho9sXIVywOT7XkBA/FrTDxNb0e+jQvG+Dj75XuLNzHZnE
         prhg1u8IgpJWSRB58NUzOdU+SQi1qMtB5UmU024mZPEjM1B6ZDiikpRs5lokAud1ctIb
         wAaVqKOF3huoTCKsaCuEFpzYvxpoLtD//aX9oDgRvYYVkKDkfOqcKQePhLOXEmq1Sy7t
         iW+dSGDU7KlSSTZaN7hkOL3o/yuAXtJ6Ie5RTFZv6XepWL8wD7pL5r8a733LVm5oOF5T
         uXWNM3YqAsODeIOV8RNIHwlMaNfBoxu95JqIry4sIjsetiM+bildj49KSHfGbUXcVZ6A
         yabQ==
X-Gm-Message-State: AFqh2kpzxBOiaTDBhPrxSX5or44gg/2CG3EiYcsT+fjwmIlVecdka6qJ
	HU8KOarD5jundMFPSFSHWpUnesbn0+74XlJJ
X-Google-Smtp-Source: AMrXdXvprwqeO1sYyJAc2mcFG4t7ASTFUsJUdV61CCrza2i/K9kGZxDLNM1iO74sdjDDHZIEdiF7qg==
X-Received: by 2002:a62:5f43:0:b0:576:dc40:6db9 with SMTP id t64-20020a625f43000000b00576dc406db9mr24269467pfb.13.1672189699426;
        Tue, 27 Dec 2022 17:08:19 -0800 (PST)
Received: from pmalani.c.googlers.com.com (33.5.83.34.bc.googleusercontent.com. [34.83.5.33])
        by smtp.gmail.com with ESMTPSA id 68-20020a621947000000b00580e679dcf2sm6045566pfz.157.2022.12.27.17.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 17:08:19 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: heikki.krogerus@linux.intel.com,
	Prashant Malani <pmalani@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Evan Green <evgreen@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Lee Jones <lee.jones@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: [PATCH 07/10] platform/chrome: cros_ec_typec: Alter module name with hyphens
Date: Wed, 28 Dec 2022 00:45:10 +0000
Message-Id: <20221228004648.793339-8-pmalani@chromium.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20221228004648.793339-1-pmalani@chromium.org>
References: <20221228004648.793339-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the Type-C module name from cros_ec_typec to cros-ec-typec. This
allows us to include more files in the same module (rather than relying
on the file name cros_ec_typec to also be the module name).

Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 drivers/platform/chrome/Kconfig  | 2 +-
 drivers/platform/chrome/Makefile | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index c1ca247987d2..5e420c27662a 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -226,7 +226,7 @@ config CROS_EC_TYPEC
 	  information from the Chrome OS EC.
 
 	  To compile this driver as a module, choose M here: the module will be
-	  called cros_ec_typec.
+	  called cros-ec-typec.
 
 config CROS_HPS_I2C
 	tristate "ChromeOS HPS device"
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index f6068d077a40..fd29fa74ba33 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -16,7 +16,8 @@ obj-$(CONFIG_CROS_TYPEC_SWITCH)		+= cros_typec_switch.o
 obj-$(CONFIG_CROS_EC_RPMSG)		+= cros_ec_rpmsg.o
 obj-$(CONFIG_CROS_EC_SPI)		+= cros_ec_spi.o
 cros_ec_lpcs-objs			:= cros_ec_lpc.o cros_ec_lpc_mec.o
-obj-$(CONFIG_CROS_EC_TYPEC)		+= cros_ec_typec.o
+cros-ec-typec-objs			:= cros_ec_typec.o
+obj-$(CONFIG_CROS_EC_TYPEC)		+= cros-ec-typec.o
 obj-$(CONFIG_CROS_EC_LPC)		+= cros_ec_lpcs.o
 obj-$(CONFIG_CROS_EC_PROTO)		+= cros_ec_proto.o cros_ec_trace.o
 obj-$(CONFIG_CROS_KBD_LED_BACKLIGHT)	+= cros_kbd_led_backlight.o
-- 
2.39.0.314.g84b9a713c41-goog

