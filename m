Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DA2185926
	for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318441; cv=none; b=J8I9SalImK6kBcu0NzPE8SBvSGvhuD53lm98Rk2P/64Lb/X8Ivz3TJuTtr7XOW4BmiMp78MLByiLaZhSlXNMo3z8DcJRtHkr47+m6lELnSJTXBiLJ9l8rtIYUHJnPQQ52tnNxMBSt3icGKjEiMR2NEOl1cRmItbjCo5KGIuLvqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318441; c=relaxed/simple;
	bh=gTgPY7UWqR1vyoGV1ZZgVjMMPO2UUtQdJrOqh6+4QXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ufckBBKjBbuS/AJjAqn/pGdc3y2574Aw6o9OdkkedaCUbHYAniV5OjhkjcBtt4CCVx7Q1teb2aMi4kngAaomiXNZsVmESVmOA6GVu8ER0KPJIjSlqrTacyhMfg/lCq+xS+Nq+v2iFiMR8uoM90lEo8jCCCEEQWdGJis4NjixeNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RhGQpuAS; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RhGQpuAS"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5d5de0e47b9so352298eaf.0
        for <chrome-platform@lists.linux.dev>; Thu, 22 Aug 2024 02:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318439; x=1724923239; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGdOo23OjShZKKUPhP64Sm0t2nst66j12GqHlKAMLTI=;
        b=RhGQpuASVMGejuKIvMbU2WM2lJdRYM1b9iNKdCCooeS9DNKRyJfsbg8lPYtUzwQXyE
         r9cKOVFXRAephJDEk7jZryQutU3GTW83Yiw7vUIX4J67GZpl3QoJV+nrMQ0p6lJzUKlb
         x9qQINdjxw9tS0mcUGDp4HSlRbe+9avnrqeSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318439; x=1724923239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGdOo23OjShZKKUPhP64Sm0t2nst66j12GqHlKAMLTI=;
        b=LyVFnHjxFqWoKe7Ry+b4P0QmVJUxMKUlD+j011QxusKmmBJEw5Ir5BnifGhaBGAEO3
         sAK0CtXesPm8ID5mTIeprxfwi9WtPmwh1QwgRivCxX5dP4Wf4n1hCOmSiNOKGzz5eEiD
         +h9L5mzxrrBStKB5mqDcQC2sLzTTASzSQtmOvm8KbTy1646upT7O6pWZMrlLQsD67aIk
         L9skYM0MVP5AtBoNT0YGMewO1PDj5JiJgilLn83AzsOH7k3Sba0A9ltPIHAWFKyMOMeu
         3Knz4U792+7uSPdd9c/g2OhjGdrA0DJmu4EVo6AifmcLBWhtDcEbqS4APCdUPPkkXJgW
         HMBw==
X-Forwarded-Encrypted: i=1; AJvYcCUeRrZ/wsPsfH1g7o84CrmK4hvIE0aXLRkzcfBbpTvavhIPywinSeEEr4P4O9dJBR5gsBsezkUXxt1E1LULT6U=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh9HN2CVT4OMkhL9cDUDLNIjKsoYBIEpSniovi3qBPwoSoJYZP
	t4ZD0tR8Y0yL+ojnuS0C8pOa9nmTZclboNMzWlCEt5EiJpwUzb3apCUXWyMwtA==
X-Google-Smtp-Source: AGHT+IGg4vXGxgKXD8IY1cy882/n6HazEz1G403uPDeFfsv+SBpWVZIvn3E7WqFDu7Zn4wJDa5xJAA==
X-Received: by 2002:a05:6358:2624:b0:1af:3b39:8183 with SMTP id e5c5f4694b2df-1b59fce12c4mr581766055d.20.1724318439044;
        Thu, 22 Aug 2024 02:20:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:38 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v5 05/10] gpiolib: Add gpio_property_name_length()
Date: Thu, 22 Aug 2024 17:19:58 +0800
Message-ID: <20240822092006.3134096-6-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C device tree component prober needs to get and toggle GPIO lines
for the components it intends to probe. These components may not use the
same name for their GPIO lines, so the prober must go through the device
tree, check each property to see it is a GPIO property, and get the GPIO
line.

Instead of duplicating the GPIO suffixes, or exporting them to the
prober to do pattern matching, simply add and export a new function that
does the pattern matching and returns the length of the GPIO name. The
caller can then use that to copy out the name if it needs to.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v4:
- new patch

Depends on commit 4b91188dced8 ("gpiolib: Replace gpio_suffix_count
with NULL-terminated array").
---
 drivers/gpio/gpiolib.c        | 44 +++++++++++++++++++++++++++++++++++
 include/linux/gpio/consumer.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 3903d0a75304..e4228ef6f131 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4295,6 +4295,50 @@ struct gpio_desc *fwnode_gpiod_get_index(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_gpiod_get_index);
 
+/**
+ * gpio_property_name_length - Returns the GPIO name length from a property name
+ * @str:	string to check
+ *
+ * This function checks if the given name matches the GPIO property patterns, and
+ * returns the length of the name of the GPIO. The pattern is "*-<GPIO suffix>"
+ * or just "<GPIO suffix>".
+ *
+ * Returns:
+ * The length of the string before '-' if it matches "*-<GPIO suffix>", or
+ * 0 if no name part, just the suffix, or
+ * -EINVAL if the string doesn't match the pattern.
+ */
+int gpio_property_name_length(const char *str)
+{
+	size_t len;
+
+	len = strlen(str);
+
+	/* string need to be at minimum len(gpio) */
+	if (len < 4)
+		return -EINVAL;
+
+	/* Check for no-name case: "gpio" / "gpios" */
+	for (const char *const *p = gpio_suffixes; *p; p++)
+		if (!strcmp(str, *p))
+			return 0;
+
+	for (size_t i = len - 4; i > 0; i--) {
+		/* find right-most '-' and check if remainder matches suffix */
+		if (str[i] != '-')
+			continue;
+
+		for (const char *const *p = gpio_suffixes; *p; p++)
+			if (!strcmp(str + i + 1, *p))
+				return i;
+
+		return -EINVAL;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(gpio_property_name_length);
+
 /**
  * gpiod_count - return the number of GPIOs associated with a device / function
  *		or -ENOENT if no GPIO has been assigned to the requested function
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index db2dfbae8edb..ce3a5f86a037 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -56,6 +56,8 @@ enum gpiod_flags {
 
 #ifdef CONFIG_GPIOLIB
 
+int gpio_property_name_length(const char *name);
+
 /* Return the number of GPIOs associated with a device / function */
 int gpiod_count(struct device *dev, const char *con_id);
 
-- 
2.46.0.184.g6999bdac58-goog

