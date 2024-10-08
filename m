Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819B61C242D
	for <chrome-platform@lists.linux.dev>; Tue,  8 Oct 2024 07:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728372909; cv=none; b=WC3qKGiE2i68TnZlG+4Dh/nrfFo1CnQfneHGzH1nFBhv0p1NdS58sBQk7WFAlcMKyxAcFZ86+aPlybK6aXLW1/5KHI8CpqZGZydE4uLrkQCWpoP1s/hIVW6YirmdQhuBkQ4CIWgBOO0icJ59UXdH/SDOkWApYtCMqttwuwxhj5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728372909; c=relaxed/simple;
	bh=VLQYF1yplf7AxMnmlaVUPVzibwbvLqQiWe1pLK515hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zepfmx/ySvuFT4oawo2+lm9xlNDtWH5Vx7BG6Trsx2VZAsX7JNPW33d+64zKlQrvfJl5PMfJFF4zkty3/47cs7vgUgxPe0tO/c2gWuA/A0hDjanlk0xZXh9RCLl48XsYiZZADSGWpJJT6yMJHEx3UAEb689fJRz1D1yibmFK2G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YGWzWAp3; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YGWzWAp3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20bb610be6aso59138775ad.1
        for <chrome-platform@lists.linux.dev>; Tue, 08 Oct 2024 00:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372906; x=1728977706; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sPUO/QyLYbgAXcOBLeyWR3uKE5ceZyKuapBUH4+Vdho=;
        b=YGWzWAp3ssh8S0+0aRO0wiyk9nGR9iKcNjfu+Pc1eYqplv35HAtL3ydfG5aIh5it1C
         SLAuxFqAVdzjIekoSE8c5k6FT5OR0L1d2Tr/1ZOExIdXwE7GQ9nimRRBFIK6kYyrj4V+
         PCjllfp0IVxnvOl1RVUlc14DFpI8Wc9DYy+vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372906; x=1728977706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sPUO/QyLYbgAXcOBLeyWR3uKE5ceZyKuapBUH4+Vdho=;
        b=KVCNSWZxRxoN6ytNKoZ1R/3wzg8Q5e6GBZ+WDS5GXhJU/Cn06kOQutowvNfZN0xzUT
         IEOD3NUZSbSpod3pdaOQgx6SfxWs2o2aV68xpHLDPt/WgV9HQj4Ex7LWJxxzN0otb3yj
         2rwiq5NDKEIHKm/mrJklbY5CmRoIP2F+PSMxC7kTJ0bmXsliSTDqTznMt6TFDNSQgXoS
         REl6jdEFRxT1hhSn3K/n35Q1/mX9WdBO6bEOBEm/wFnTKr2tBRqWK24Ev1hfS5jfTC4z
         LrY6+q4YUKhfaVqnqoPFjTq1sXuEog3ZG8mIw30vSB+G0mz4kCdKQer9Dq8wpuPHEkJG
         Ld8g==
X-Forwarded-Encrypted: i=1; AJvYcCUuWDdKu1OUVHS2zDkjRhkSYvs+kbXVILVMabjEqJ5Rd1jlnFbnm1f/G56UfavVLTHP24zaKsB6cmqac1yFhyc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz2OmhQdv/0udfTk70TBtWjJsp1qiJN4pNOW2VVS79UrjTNnyj
	IxDmJdphIeVN/Fpcesdwz4rcnJ30b6thSXb2337ZZnh0J2EuXhIyWgMatZVe7A==
X-Google-Smtp-Source: AGHT+IHw2VKleWZGjUzsOr2cjHRHd5ZZtRaR+rzZ7wLp6Io7cZVGwb3z9BPQYRo0UmvC/P2G9wcZcg==
X-Received: by 2002:a17:903:22cd:b0:20b:aed1:bf8f with SMTP id d9443c01a7336-20bfe298189mr218586815ad.42.1728372905977;
        Tue, 08 Oct 2024 00:35:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:35:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
	linux-i2c@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v8 3/8] i2c: core: Remove extra space in Makefile
Date: Tue,  8 Oct 2024 15:34:22 +0800
Message-ID: <20241008073430.3992087-4-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241008073430.3992087-1-wenst@chromium.org>
References: <20241008073430.3992087-1-wenst@chromium.org>
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
Changes since v7:
- Collected Andi's Reviewed-by
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
2.47.0.rc0.187.ge670bccf7e-goog

