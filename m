Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC3D227574
	for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 12:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610435; cv=none; b=ANISj3Zd0U7vJ68vZeQXGsfWSkcl7CEQvG+4YfgmSFnCRERoMNcRpG9uTelWxhkKazTe1qQ4oCgv93Fu0DMPRZrETvbGHfWB5557Pxl83MzMGewZZY/x15RW0bXY1sMn/QIkZ998vlwsmaRX9uFibq8LcusBjEMO4yNKNFHzQ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610435; c=relaxed/simple;
	bh=5SP7c9LZmhzTB3Sd70fuAWrzLoIu061KLAW3J8lMM80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cK4COZaJ2Ruuw7cUxa/oZACGoYfyCPbdTbdxyiza7T5/BhmSWzYQpwA5ixt9aINVMpVMCGu5ozIt2pKvWUXbiLHnmTym2bMXN7HuLvSHmuNU2JWkUvfLtNBQv1JvibLbg96cdrWW2/YMjXraO6d+ZRm9jEhhdEFarpk73nfdMpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VjPpr6yL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VjPpr6yL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390f5f48eafso2075765f8f.0
        for <chrome-platform@lists.linux.dev>; Mon, 10 Mar 2025 05:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741610432; x=1742215232; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9vKM2NqG0d/mIXKZKZnbzuk8clRyDtuK0UmfTRLKjo=;
        b=VjPpr6yLUC6EDngE/XM6lLXEP21jQ/8IyyYHKPMqRbT04gZhvkgj4r1nwE1qtsjhvH
         aMl08stLpztbHaQHE5lO/enUCyUMf/eqxA48h/7Lf78DNOG66IL/FRF0XiDbEIs7dUYy
         d1VTc+b8R8apXXu9qPoySdd55wP8Y2U0Zozui8D+IIqyWjlGS9R/LU/0NQdR9YEH0zzg
         TTxkgD0UCFfHMDMArUzUEjnsHI6soB8n+RSmjiS7SUh+fOtmzrqOnd0QgNqneNlwr4i1
         Z4kfKNROmx/QwK3LFTmCa8XdECkyaxteanfqU/ycR0M8aptap22aB8chKxH2WcgTJ/LX
         tSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741610432; x=1742215232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9vKM2NqG0d/mIXKZKZnbzuk8clRyDtuK0UmfTRLKjo=;
        b=AMjmzr/d/GrgqlpCczLYYCemNFYmSQoAVSarhyiaBDgr9xolnQq2zNu+r2IiCRXlR5
         /5CSZmgHzELdjOqROrHBad8g4rQ4mHkszgxZnOiHnIPmF0AQzT0rpfH8+AsCJYJImG/8
         L7ml8tY514xf64sVLBxSYRACmQ5TR3DDonune061kt9VmJNgEyuhTewJ8jeLat7wsgGF
         dDXBWqwro2briD/metArWpSWGWjLLzUOCJN9ZKP4kVTGii7AUXcMCjemwq5ER9DHakmH
         bWQf/zIIo0GC3ujt2TI95veF8xRADyAfMLxNPAZgEys9tCbirLj07wj6Xbv6Sapktx8i
         9RXg==
X-Forwarded-Encrypted: i=1; AJvYcCXuLZ22/WGiAK4O3zLhGoTZ8vPdBLDUVXgF6s1SQuLXskkfogsIt3PC3yGHncv/PKKR4HZKLjnFr9Zow812DCU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWnXLWYBwsPz71NWj212lPOAJRK/xLIXt4LPrf7BnuKDi5rdk6
	NcaxACodBbftR85pblJKRwmC+K6/oyjrOuZCC5uQ7lROqETTGFnV9VRPdxhNuE0=
X-Gm-Gg: ASbGncuIrlfhcEL8illbZ8vZE5WPbYgszOAHvQ1PTx86yRqr4ybgOOnzYvdY9H1qJfT
	8xyxQXTmNoJhi+0PE+miRrWwWgSCPl+J5Sp0V2/UqSiz+SoH8ejsebtPj9XTG4IBvT4r7Po/nJL
	Dj2M4CZlsCMUyBeEnLAzYgah1SSl0iGK3iH35oJQHmZB2oWEkQp4+Y+ZQIf2kMS3A6sLTMpJQwr
	jw6JI4P+TW0jTNHcwUXJMqWbFK7LCB+WbDaxkhUYrhci1d+8W7kY5dI/GYmkJ/7E1ubd/6BW2Nm
	KE1w5mE+hADozRKirfs/v5rnkx8wkOzXShqhSA==
X-Google-Smtp-Source: AGHT+IHirIBi268WVNrXJb8nSLfBOn2zE3qJRsiRuXXJzWwl/IWx5gRbkFVSetYSD+YqWYxCwV2UmQ==
X-Received: by 2002:a05:6000:1a8e:b0:38d:d701:419c with SMTP id ffacd0b85a97d-39132dc5717mr7516476f8f.41.1741610432227;
        Mon, 10 Mar 2025 05:40:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2711:39c0:fb51:b639])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfdc5sm14535865f8f.25.2025.03.10.05.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 05:40:31 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 10 Mar 2025 13:40:20 +0100
Subject: [PATCH 06/15] gpio: bt8xx: allow to build the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-gpiochip-set-conversion-v1-6-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
To: Ray Jui <rjui@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, Michael Buesch <m@bues.ch>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Support Opensource <support.opensource@diasemi.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=603;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=HM+nOzctEfj4SKGt3f/npQjS/nebRuckql5RBo2YHvk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnzt22XKhxDpceKw9s3GwK38TDwn1P/4/8jyV/1
 op/G4g/1GWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ87dtgAKCRARpy6gFHHX
 cgZoD/9Tv1NzmtUetdANt9hTuIv6Cuv0EuAUV1poJeKpLIc2bKENgK14DVlrT5ussU/ndHG5GOh
 FjQrpxS/OFNLpEbOn8II6OeQLjjIcdX6OAFV3vxsNEgEizc+7sqoqUsnToI8ig05A+c0850d2pr
 jFkGEp8bq7y6rsbCZYsPRZZXEUlcmH/uOszR7Lh7TLwgmSnCmMWsTADAdTOuWMVvw9zWHIlySEk
 DInHW1Sy8l92Jss/0SdEaUFqnhYV7rxDShXcfaiNZKdvZ9SnJl+48SrK7xdrwoiHywzhoQ8WJQh
 DnwGuiAmm1RrF4OoS84mGWmL8ymZ2NEBzI+pMT3UhXvkpXV+o4bv0KFbERTa0gPPq6PI7LXKWPG
 pY8ctqXA9X3aDz2fVzPvlZTMZYneUxWvU/VmQlk8davmlvlGGCVAa9SQwYZ5wGilpCfhGJnU6Bj
 CMvAhA0RJh/G/3sBac0nPeuTHE+Ae586tmxAkHMsl9xaf2JwaIt0RrdRcgbJ6MwTG2nJ6g+vsPF
 YBEbgmtXE9znBAWuxTMBCjqmXGV+HXNF4naj/rwsfP+fOaBOr8yXh6KJYE+hNPeq97S63W9ESah
 lNdDWck29TE3hEQHquHLkhvQKeuNZoW03QSYk8dmjeF5HJShhcVaI3JH2C7kri41gqOOh2Wsfzq
 mA9QTEFZVb7hXlA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3e9b174fee84..f2c39bbff83a 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1671,7 +1671,7 @@ config GPIO_AMD8111
 
 config GPIO_BT8XX
 	tristate "BT8XX GPIO abuser"
-	depends on VIDEO_BT848=n
+	depends on VIDEO_BT848=n || COMPILE_TEST
 	help
 	  The BT8xx frame grabber chip has 24 GPIO pins that can be abused
 	  as a cheap PCI GPIO card.

-- 
2.45.2

