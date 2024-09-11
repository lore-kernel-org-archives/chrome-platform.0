Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71E9149002
	for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 07:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039718; cv=none; b=ubEpNQNqKxJFkbvGTC3YkG5P+rh+1A8VkIs311UrV95DlmBgpeRFCITtz6hKcNq75ZLj8hNCHEklE8sloyPHDqiRYh/R6yyUq9s5S6bHgGOiQTqOTl4V/4IoskF+5eHex2D6ipaW6w89oUv3jKKA4xEKG2BDufUKUjzMX3Qoddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039718; c=relaxed/simple;
	bh=XxiTjlQcSLEHrjz0okO6v8gsp7M/kr47QP0mR5JSK08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QBrEhaUOUBkRUeaFslnaObjX7H/JMA4q1MpRzEu1sOiXiUM3Rke874NIh8cAAaKbwZgqL7KFjlZQj4GPh69ptZKCXMjxZNg5tTMC/YMAjDHl3FuJ5+e0Juj7R5CVsLqjJF4U1MRP0ivO4nXY5u57Upl8dIoyQDaTmJY1wLTYNic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nve987BM; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nve987BM"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-7d4fbe62bf5so4092983a12.0
        for <chrome-platform@lists.linux.dev>; Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039716; x=1726644516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZj+Rwt2K/givoXdUXg/sARHG7LMQ+JDTIquBzN2oCY=;
        b=nve987BMPPPB0MPOdl2XGfqGvLUv0e0rkddSu2ve0LQFhtet4kpIvu/ZHfCYofBCl/
         LmUy70szEpt1eLS7GVPhbmxpUmb6bRMMZYodzqgwm4f+/0TU2aAZ8y5sl2lZeYq+UsCz
         +1e5YDXQb+PfWBNM8XyE5pAZGHcoLete2/wL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039716; x=1726644516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TZj+Rwt2K/givoXdUXg/sARHG7LMQ+JDTIquBzN2oCY=;
        b=dH28v9TB60D2OD2atvgArhiSOJKc4SK9Up9vfvenwGolkqE+DuOocf2qPl+gr48kLX
         /cmLVEVpKl+u0gjeDUdmh5afw58oFMcsE4qD+2TW1zWABdMRA5ZiSb1aZt+sRQp4kIDG
         Th1jewC8fzdkC0waiPv2ZfW81YGzG6KHnPJjI9pjmw8IZXM3EZfvHQMqBVe86m35FaOr
         KjUdGJSPL3JPWTFatmc+ZTQoJsdAVKSwe/skvLBGjW8ddot6KQzNhhLskCENhyHH5ykc
         QFtJ1imJjeJc0u0x1P4bUFFnUKiu9Xj8Ju7WNCk4kZhrSAchJ0fZPRX98g2+xK0vdhka
         WlQw==
X-Forwarded-Encrypted: i=1; AJvYcCX6dVAwwTCRgtjhsNDF9b86IMLxj/WbDTkxNqEjrLDN6LhF7jMZsNwkl3ADwOW6P2j9nYZUVPZ0HX3MhbyrI4M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzysK8xaZnHnMtxZG2FuuQIWvDoEXXR6FF/g7NFRAkgJVnT3BJ2
	ZN0ikqQPlHrTEEoZpfdHW6K73CTdlV4l7LmNnZiShPD+OezXk8dvPoX6l4J4qg==
X-Google-Smtp-Source: AGHT+IHedUO15STr+MI+20JywnkGwOWN1412qS2q6DZSwhZSeZ7SKRwPtcyUrKy5SFYgpsHfqp5wRg==
X-Received: by 2002:a05:6a20:cd0e:b0:1c0:eba5:e192 with SMTP id adf61e73a8af0-1cf5e0f52bcmr4279897637.27.1726039716399;
        Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:36 -0700 (PDT)
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
Subject: [PATCH v7 05/10] i2c: core: Remove extra space in Makefile
Date: Wed, 11 Sep 2024 15:27:43 +0800
Message-ID: <20240911072751.365361-6-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some lines in the Makefile have a space before tabs. Remove those.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/all/ZsdE0PxKnGRjzChl@smile.fi.intel.com/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes since v6:
- Collected Andy's Reviewed-by
Changes since v5:
- new patch
---
 drivers/i2c/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 3f71ce4711e3..f12d6b10a85e 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -5,10 +5,10 @@
 
 obj-$(CONFIG_I2C_BOARDINFO)	+= i2c-boardinfo.o
 obj-$(CONFIG_I2C)		+= i2c-core.o
-i2c-core-objs 			:= i2c-core-base.o i2c-core-smbus.o
+i2c-core-objs			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
-i2c-core-$(CONFIG_I2C_SLAVE) 	+= i2c-core-slave.o
-i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
+i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
+i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
 
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
-- 
2.46.0.598.g6f2099f65c-goog

