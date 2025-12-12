Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321F5235C01
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 02:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507540; cv=none; b=KI5JQs6tHAG6LjbAB/HC1ZNfzgfpzeTTaRNZrCrrUj0pgamCwH8VNmS26DqQINtrl5hHHtR2jyFIh1wONKCz4j8cKlcLNF5mBvQBa60RTMKLnr1DPs/R/49clTF0BlV2hVg4YlDjF8c3QSOJ3YoDM7IE97BENyBV83Sj8dCcvrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507540; c=relaxed/simple;
	bh=7SnGSJpibYGFAnb6vZa0zbW6Dvi4kjS30WQhK+aIQYo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rUcha02+Iu+MGdh3SO4D7BqxZ/klO5fhw8I1CzZ3lP0FLrA2jwb7dRsTokrnhdU6yyMaOBLCkIk7svMYfvfCh3CyTuTxWu/iMAz5smWbU4EghF2Ds1wQ2oK4S2PuxaAPKeda8UYdHDWkOGNP2kL5sClSnkS1PP9tuXoDjxz9HE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wo0m1kc0; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo0m1kc0"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93f6bd3a8f4so275614241.3
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 18:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507537; x=1766112337; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tqUfOJ2MpnpIg6I6R6ObmosGG7cC8tkknkU/CWzIndk=;
        b=Wo0m1kc0nFdUUFfx3QVA/RnosIVUPRtcvTlb+xLbQPK80RCWW2vTSXNkZYxJ/xQKT1
         IIxRloXMP+61w149iUCsYDvx4oJXLGhm5MpIN9jSqHHLLNszVTnSr0W9Fgc2ddpa6ag1
         1bOUVoV9/NYO5vNTAd+8u9P8zUfTF+ZCtt4NEBeyqR8Ip6cGdFysZ8qXLvgigM8jxtNp
         NfmTlY+vbAv3ySM/omud0yfYWEfFgARin5V25uLe0w6FpghQF8LyKgEdHpkonVkGmgiV
         +099XXDZ7B7eHn9EbaH+mHU0rXRZAGRDrjjxf0CWA2nqpTzMZzuEClvE9onae19rQdao
         aaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507537; x=1766112337;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tqUfOJ2MpnpIg6I6R6ObmosGG7cC8tkknkU/CWzIndk=;
        b=CAGas7M3mecXR9DLHn121VfkOgCHWzq0vus1A5E3UWrbjZdewTgwzwdukNYyNR6cg8
         e7y/FbIRLZ5/Q5Eg2npubztja9HNc1x2zVz2Ct+TjJCzoMiV/DYqSBykw9V4h/cVqkOY
         qHG9QuM0ITnLAXxYnAOBs9mUoUIgmAyfL/JIqm7LqEfoRMyKAopO6dNGnc40N4e+5QGB
         4/rVgB+24rurABGOEZnYxv5SO4gF0m83xMAnKdyaCFLnx5I7ftFY75P2OaSMHUzs/Axg
         mpSTVP3GUyLqXjQzsj7twxHtNtJN2QNnCXBa0XmjD/7fTrhBhzRcxDTAv4nbyLsZ1EwX
         NnaA==
X-Forwarded-Encrypted: i=1; AJvYcCWxZbB9kevfb55d62d0wPtQC9fYpz2syAXw81h/UWX8gBWPqYnjHftkE13gqCQFIfCiG1LjsCLRpMVgwNBWzp8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0qOr8Gp6RZHcTd4VNAVR4qgmJEQhnqDzuMZJQ5onPz154jdMu
	3cJvyTsLHuhRUKas87e/5OmYqBrPr3t9tbma94CCm5p5Dq6A0X1BRPza
X-Gm-Gg: AY/fxX71KeGuS8FXWAtQtBKyhj/hH1V3cRhAodIpqKbgJqOBJCd+CmtIsrE8vyHfRo3
	FyUVCIX7RiuHy/nA1OPhh2Roma+2EBVsERHR6rKO8NZpXC4yy9YSfPf10wj8kJDViIe7UzS+mrr
	RJJp+RBiP2dqpArsKUdHUaXYW8yBlNWxDaRUpSFOj7N6t/f8twhbDSUOX+Q+l/9QGnCuLSsl3ku
	w8uP/yaLb/MVwbPnk6d5Dwu5Oy4fPPfPPqrrLvsDSTm8RlKvPCv357NG2nNQ8PyqgIlodd7DzHk
	wcefkGuNEYZAcnbdAdFKScBqT9CWH8urnzS0WzSHxl6nyfkF9IGMAXbxnJ8ftTAISrbsfOhHRwX
	mjxjXEHlbeeUpFOavvjwmRxg5oGNCbx+hpAO867PtCBvKb2uxgVndNNKwGxKNjsllszbpOgQkGc
	B6qqehFuAJ8t5n
X-Google-Smtp-Source: AGHT+IFq+nI0XTsFckma+Yfl9/xt3eH3T2uKqEet5T2xPP0xd+PyXmltY17WCUkxWPvw7Z4FXNZveQ==
X-Received: by 2002:a05:6102:3907:b0:522:86ea:42c with SMTP id ada2fe7eead31-5e82768ad0fmr132282137.11.1765507537060;
        Thu, 11 Dec 2025 18:45:37 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0f25ce2sm1693762137.8.2025.12.11.18.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:45:36 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 11 Dec 2025 21:45:20 -0500
Subject: [PATCH v2 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-lock-impr-v2-2-6fb47bdaaf24@gmail.com>
References: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
In-Reply-To: <20251211-lock-impr-v2-0-6fb47bdaaf24@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Gwendal Grignou <gwendal@chromium.org>, 
 Shrikant Raskar <raskar.shree97@gmail.com>, 
 Per-Daniel Olsson <perdaniel.olsson@axis.com>
Cc: David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-iio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4257; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=7SnGSJpibYGFAnb6vZa0zbW6Dvi4kjS30WQhK+aIQYo=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnWjSetWbfOjdFlur12gmM0s1v3+7939z+f9dHU6vDWB
 258Ua52HSUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCR9HMMfyUsO1blLNA5danH
 V623R/xY41n2og9z/K9e07J+KPDi7SqGrwI3PxyYWO7HdutF+fOdMbxu54zce/izrb5/mJ54fXM
 yKwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

In order to eventually unify the locking API, implement
iio_device_claim_direct() fully inline, with the use of
__iio_dev_mode_lock(), which takes care of sparse annotations.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/industrialio-core.c | 44 -----------------------------------------
 include/linux/iio/iio.h         | 38 +++++++++++++++++++++++------------
 2 files changed, 25 insertions(+), 57 deletions(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 1cce2d1ecef1..cffc6efb6617 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2201,50 +2201,6 @@ void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
 }
 EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
 
-/**
- * __iio_device_claim_direct - Keep device in direct mode
- * @indio_dev:	the iio_dev associated with the device
- *
- * If the device is in direct mode it is guaranteed to stay
- * that way until __iio_device_release_direct() is called.
- *
- * Use with __iio_device_release_direct().
- *
- * Drivers should only call iio_device_claim_direct().
- *
- * Returns: true on success, false on failure.
- */
-bool __iio_device_claim_direct(struct iio_dev *indio_dev)
-{
-	struct iio_dev_opaque *iio_dev_opaque = to_iio_dev_opaque(indio_dev);
-
-	mutex_lock(&iio_dev_opaque->mlock);
-
-	if (iio_buffer_enabled(indio_dev)) {
-		mutex_unlock(&iio_dev_opaque->mlock);
-		return false;
-	}
-	return true;
-}
-EXPORT_SYMBOL_GPL(__iio_device_claim_direct);
-
-/**
- * __iio_device_release_direct - releases claim on direct mode
- * @indio_dev:	the iio_dev associated with the device
- *
- * Release the claim. Device is no longer guaranteed to stay
- * in direct mode.
- *
- * Drivers should only call iio_device_release_direct().
- *
- * Use with __iio_device_claim_direct()
- */
-void __iio_device_release_direct(struct iio_dev *indio_dev)
-{
-	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
-}
-EXPORT_SYMBOL_GPL(__iio_device_release_direct);
-
 /**
  * iio_device_claim_buffer_mode - Keep device in buffer mode
  * @indio_dev:	the iio_dev associated with the device
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index aecda887d833..76398dbfa5ca 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -664,30 +664,42 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
 
 void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
-bool __iio_device_claim_direct(struct iio_dev *indio_dev);
-void __iio_device_release_direct(struct iio_dev *indio_dev);
 
-/*
- * Helper functions that allow claim and release of direct mode
- * in a fashion that doesn't generate many false positives from sparse.
- * Note this must remain static inline in the header so that sparse
- * can see the __acquire() marking. Revisit when sparse supports
- * __cond_acquires()
+/**
+ * iio_device_claim_direct - Keep device in direct mode
+ * @indio_dev:	the iio_dev associated with the device
+ *
+ * If the device is in direct mode it is guaranteed to stay
+ * that way until iio_device_release_direct() is called.
+ *
+ * Use with iio_device_release_direct().
+ *
+ * Returns: true on success, false on failure.
  */
 static inline bool iio_device_claim_direct(struct iio_dev *indio_dev)
 {
-	if (!__iio_device_claim_direct(indio_dev))
-		return false;
+	__iio_dev_mode_lock(indio_dev);
 
-	__acquire(iio_dev);
+	if (iio_buffer_enabled(indio_dev)) {
+		__iio_dev_mode_unlock(indio_dev);
+		return false;
+	}
 
 	return true;
 }
 
+/**
+ * iio_device_release_direct - Releases claim on direct mode
+ * @indio_dev:	the iio_dev associated with the device
+ *
+ * Release the claim. Device is no longer guaranteed to stay
+ * in direct mode.
+ *
+ * Use with iio_device_claim_direct()
+ */
 static inline void iio_device_release_direct(struct iio_dev *indio_dev)
 {
-	__iio_device_release_direct(indio_dev);
-	__release(indio_dev);
+	__iio_dev_mode_unlock(indio_dev);
 }
 
 int iio_device_claim_buffer_mode(struct iio_dev *indio_dev);

-- 
2.52.0

