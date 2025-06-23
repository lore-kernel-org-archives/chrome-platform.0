Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE36D246BCF
	for <chrome-platform@lists.linux.dev>; Mon, 23 Jun 2025 18:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750704718; cv=none; b=F/t7+l6XydHsss4zHD6dnynEuWcm4p57lXS4T2y0qElO/86oC8fW5wXIewq3HRQGVR/Ul+bUy1NTK2/4CvFmx3L4y3PfSpA02/7C7FanSbtxJSw9Ldh9Zp+ae6YkSzL+yNWvgR1ITUVDHlVcnyjk6hKLFcGyLkEM42vKmMpB/4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750704718; c=relaxed/simple;
	bh=q9A/v/AoElE4bRp3rvOFK7egX7qzgKAtVpuAnaal8V8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oC1b5poFKi+WtoknzbUZ7CyeGd6U9HJsecRutwTU4MlNcb8x9Y8ky40Fp1WAkSAaNNTUcOjh9ObzKwHAvXC/VnUNSvHmGhr/RT9o9H1zy9O6vI678xSkrcGCHtgRTb4OQ0p2D9AX/qhxWYV1450SgGcvW7NEUhSKQOT2o8Texhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nbyWWMsM; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nbyWWMsM"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-748feca4a61so2512385b3a.3
        for <chrome-platform@lists.linux.dev>; Mon, 23 Jun 2025 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750704716; x=1751309516; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=98QCoYuCDq3/lBJQY34bvYbqds2nKyh0mPMn5M3JKis=;
        b=nbyWWMsMNYU3ZIDQBrYDLNz+I9uMhrqYHpXE1l2qfoIllxThFYJ6e1BECcZGxsNUG0
         pRWamqgpBmT51rRrX7TZnFXosvddllMP2W99d2jBLoWSA9906zAHbLmbd5BKvkVy3X9E
         FlBtEOqc9d5MHyeTVYXfI/nJi5vguL4U8sxl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750704716; x=1751309516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98QCoYuCDq3/lBJQY34bvYbqds2nKyh0mPMn5M3JKis=;
        b=Tv+CLKI389YXKLm2zKvIfhjsVAKnAmfynDnmt38HUtwoUXagvr+s50oruUcBIm4FxA
         /jeShD80sw7VxFRrk8D2BEYj/1YQyZLv2nUwQCYC2+wLyqK5TiUallDyH+/tUAmTcnV8
         uaBC3hFpBcQS3KlMJoSbRpeCmQVo2aKYcksQO3leTGOexJEt22k7idpFY9rA2rV7HCL+
         SYfPNMHXRw2wwTU72UvbfqsP/UbTnmErFIl9kN7X+pSKSRxAGkTMz9IWLnMlS3BZkHZh
         m5AhbrUZ9ckG/m2H/Wys1l6wnBxT8KYlpMsd1VkdaP7OyDY8kK3e/n9Zo1iJ0KaPBuRv
         dvyw==
X-Forwarded-Encrypted: i=1; AJvYcCU5cO5M8ese/UJjpOSs8KQ0kLVtTqUqb74NVsTESA0z5VDuJZn3HpBBOyExo6s1H12mRnNv8nWySoGiqDCgeKE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHpZd7DRhWBCmT7KgxEFtDAioUAl2xnHlNKAzD8JtX0QYso+FZ
	scC+lkCMsKs2w9MBzvVpauyLmbwyqkzcPJo0fCoYZ4/lS6W15JAgixSibKWWKNsz6g==
X-Gm-Gg: ASbGncux1o+fjLlumVDPtMV7sIfME7+lvEAQ4HXKlM8c4755v+NyFTgQdSOd9/v4VC+
	LWbiqnLV0qeEEC30Z45/OvGsPBo3d4Bz/0rZfpKnfbb9MvRCxXzv6+8lIxUu0OmuaKHVzz8b3Co
	BQ1WO2bhctcDgugYgVif0pKn6Y+sudXhyuVIFPeZq8qCHfNlHc78JVHbPqo+kpu23mRckrTM9DK
	zXc1HRlAwjF4zRTkAq/0kgn5RTgJ1P/BegkAvAKsQ13WPIW+Vb5kpMv9lhoA7m3AH197UDEXu3K
	bQvhJRp6E2y2Q1HLpV/ibiNf/DP3CTJB4a85BY0w69XC4m/uFe4LGgo=
X-Google-Smtp-Source: AGHT+IEF8Sm0SHzFfIUbEEOSZ9z1ni05xWFtMXFS0ZJv9jrAt0vbsNLlUl7oXBh9c0RO3vvqnqGBdA==
X-Received: by 2002:a05:6a00:3c8f:b0:747:b04e:941a with SMTP id d2e1a72fcca58-7490d72439bmr18466630b3a.17.1750704716008;
        Mon, 23 Jun 2025 11:51:56 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:eabe:52f4:36e6:5c0d])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7490a64ab09sm8909287b3a.118.2025.06.23.11.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 11:51:55 -0700 (PDT)
From: Gwendal Grignou <gwendal@chromium.org>
X-Google-Original-From: Gwendal Grignou <gwendal@google.com>
To: jic23@kernel.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev,
	linux-iio@vger.kernel.org,
	Gwendal Grignou <gwendal@google.com>
Subject: [PATCH] iio: cros_ec_activity: Fix function casting error
Date: Mon, 23 Jun 2025 11:51:52 -0700
Message-ID: <20250623185153.222714-1-gwendal@google.com>
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

.write_event_configwrite_event_config expects |state| to be an int not a
bool:
```
drivers/iio/common/cros_ec_sensors/cros_ec_activity.c:203:24: error:
incompatible function pointer types initializing
'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, int)'
with an expression of type
'int (struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type, enum iio_event_direction, bool)'
...
[-Wincompatible-function-pointer-types]
```

Fixes: 9ad446870236 ("iio: cros_ec_sensors: add cros_ec_activity driver")
Signed-off-by: Gwendal Grignou <gwendal@google.com>
---
 drivers/iio/common/cros_ec_sensors/cros_ec_activity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
index 6e38d115b6fe8..1d97a68e6ce11 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_activity.c
@@ -122,7 +122,7 @@ static int cros_ec_activity_write_event_config(struct iio_dev *indio_dev,
 					       const struct iio_chan_spec *chan,
 					       enum iio_event_type type,
 					       enum iio_event_direction dir,
-					       bool state)
+					       int state)
 {
 	struct cros_ec_sensors_state *st = iio_priv(indio_dev);
 
-- 
2.50.0.rc2.761.g2dc52ea45b-goog

