Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57414D70E
	for <chrome-platform@lists.linux.dev>; Fri, 28 Mar 2025 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168382; cv=none; b=DGejIFrOx2QXjhd/LuBg8crezxnphn10zqX/NMSGNU4cDQGQgPm69vOVeaDCcGxU7Dotmr6Vij/Ef03x5zuNW4q2KJ2RynBDfPs4Hb7Ra3ChIS+RWDu5wKIV/oZ6gvwZ24CmLcSy1iOZTlwgZ5CDyVfZUKj3nmUJ3wcnCRpks0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168382; c=relaxed/simple;
	bh=ZjPEwmC8d6yJXPD/Af2mmAD/CXzsaS4nGWUuqYQ2klA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a9WFkg702lvzXnKdXjAfK13FA5ULLqV+51J24Had9hhgxWZevANrX68BnTF5aJNBJ8eaJ6oWtbdyUc2ozu7OnB7ClhlhqyPf0VcUhjENzz2+lLCNFH+nUqDvl4D8f2pTm/FZzKqM5udFHZKKhTnTyoG5v3X1RnAjZxOQ1++giVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=id4kLOGz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="id4kLOGz"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso4071352a12.3
        for <chrome-platform@lists.linux.dev>; Fri, 28 Mar 2025 06:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743168379; x=1743773179; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x92zjhfd2x6noSpfStll/xqcTYe/rT8zkKTNHbnXK/I=;
        b=id4kLOGzcsMbe38SpXAGf8xx8hUdMrU83B1DMqHSGXbJU6tMR7RaF07WTm6vBVQHxJ
         2TpjVHgaz2ZDtSG7k2jlDv3kCyGlnJE/s0adHfERNaARc2eSzxeUVw0EihToBya12+ur
         V5pwajgRPviCuyLbKMqX93vYbD9kc45WW6G3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168379; x=1743773179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x92zjhfd2x6noSpfStll/xqcTYe/rT8zkKTNHbnXK/I=;
        b=eRPTWfFwgmxuJdv0cW7cIPlZWf5tvM4884gdYKkUV+MAW/7fw7+sVeKYsNRY0JuQAk
         GQIebUSvJuGXGOlwE6tfgyB5S2CaTAN8LvqEWLj/iVvHDTyNjgkfTRE1R4Uqw3oG4HWH
         1SoV5HsVMX5nMFdH6vaFds2xe7DjpK5Ohle/zqEo9IEPwrbXCN22E6lERIYmvxj5ZcDA
         dVnW6i+oAT7zexM8wpo2wXLSl1rdlePvRf8j669eGKsy9Ao3dlOe/FAkbWCmcT6ner5n
         r3OxI1xK1zrXgsFYHrCjwb68v53fV3ywxry3qd09IQScnu0rhNFRlQx0UXyRh43VasL6
         ZgOw==
X-Gm-Message-State: AOJu0YxGIgGvmAzXlpldHDB36l3xUY+z+5LV0Ah/xggSaLDVac0G/Fi/
	+3MYgvA4XrcTqM25NmtxFo7lQf1CvEUVVftAQGTdwy7ZQXwFkQihxggv9H1koQ==
X-Gm-Gg: ASbGncsFNrwKoQLuH40+TmgTRERIBgdzvr8CaLiW9fjtJnpz9ht3nwit7QeQXOCIXvt
	g08XdS4lFRWLz1befDKEKXJz8FYXwnQPyI/DC7jlBYy3fBWYuu9h/Hv8f6Jro2l+KhAaurETg3k
	UGGEjfsbgHhhrGjXpaolRkjt0vtXdPB1DtIc5VP1hf9IZiUSnohg6kKRQGxmv7WH5TFMNxENQQ3
	nxSPkO/VJgUnOZbDSJ9IRoFxXJzTqwzOdo//GZDDfYrrgP+3FRiUi+5rkXuU/ZqbMZgn3TaeJXU
	5uiGoXyNsM5TORw0eRAFqkpB1N5gFiLQyyZf6THNNr9LTboOQtwfottT4WMeUgpt62ixBvLNsE/
	vpykgFWj+czkHU+eZpkjzeZHpQNkV9HgE+g==
X-Google-Smtp-Source: AGHT+IGZz7/5rdEd+k2LnpfWVd2CubAVWU4pOV0U+4t4bZFMZn0KMjyPhCW1xU9L8mZ2Wc+waAiwmg==
X-Received: by 2002:a05:6402:270b:b0:5e5:bcd6:4ad8 with SMTP id 4fb4d7f45d1cf-5ed8e28ae2dmr7247798a12.9.1743168378947;
        Fri, 28 Mar 2025 06:26:18 -0700 (PDT)
Received: from srosek-gl03.c.googlers.com.com (157.250.32.34.bc.googleusercontent.com. [34.32.250.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc16eda94sm1413457a12.33.2025.03.28.06.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:26:18 -0700 (PDT)
From: Slawomir Rosek <srosek@chromium.org>
To: Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ukaszb@chromium.org,
	Slawomir Rosek <srosek@chromium.org>
Subject: [PATCH v1] platform/chrome: cros_ec_proto: allow to build as module
Date: Fri, 28 Mar 2025 13:26:12 +0000
Message-ID: <20250328132612.511471-1-srosek@chromium.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows to build ChromeOS EC communication protocol helpers as
kernel module which is particularly useful for Android GKI (Generic
Kernel Image) configuration. With this change the ChromeOS Platform
(CONFIG_CHROME_PLATFORMS=y) can be enabled directly from the vendor
kconfig fragment whithout additional configuration in gki_defconfig.

Signed-off-by: Slawomir Rosek <srosek@chromium.org>
---
 drivers/platform/chrome/Kconfig         | 2 +-
 drivers/platform/chrome/Makefile        | 3 ++-
 drivers/platform/chrome/cros_ec_proto.c | 3 +++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 1b2f2bd09662..f523ae3d3be0 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -155,7 +155,7 @@ config CROS_EC_LPC
 	  module will be called cros_ec_lpcs.
 
 config CROS_EC_PROTO
-	bool
+	tristate
 	help
 	  ChromeOS EC communication protocol helpers.
 
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 1a5a484563cc..b981a1bb5bd8 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -25,7 +25,8 @@ endif
 obj-$(CONFIG_CROS_EC_TYPEC)		+= cros-ec-typec.o
 
 obj-$(CONFIG_CROS_EC_LPC)		+= cros_ec_lpcs.o
-obj-$(CONFIG_CROS_EC_PROTO)		+= cros_ec_proto.o cros_ec_trace.o
+cros-ec-proto-objs			:= cros_ec_proto.o cros_ec_trace.o
+obj-$(CONFIG_CROS_EC_PROTO)		+= cros-ec-proto.o
 obj-$(CONFIG_CROS_KBD_LED_BACKLIGHT)	+= cros_kbd_led_backlight.o
 obj-$(CONFIG_CROS_EC_CHARDEV)		+= cros_ec_chardev.o
 obj-$(CONFIG_CROS_EC_LIGHTBAR)		+= cros_ec_lightbar.o
diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 877b107fee4b..f90d2e7b616c 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -1157,3 +1157,6 @@ int cros_ec_get_cmd_versions(struct cros_ec_device *ec_dev, u16 cmd)
 		return resp.version_mask;
 }
 EXPORT_SYMBOL_GPL(cros_ec_get_cmd_versions);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ChromeOS EC communication protocol helpers");
-- 
2.49.0.472.ge94155a9ec-goog

