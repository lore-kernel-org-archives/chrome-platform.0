Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6502A288D6
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751105; cv=none; b=tB3545Sob8MTlugMT0m8GpJ6CQD7T/uBXO8CqQ581aXyk1o4pQKFpn7fRdsF5jkfIdWhoIPIlNGykthmjvtXIWxDzBHcNn1SlH3caQc6HVHZVcwTe0qSgOFIkYKWByPhJ5f0nZGzoxTAEaY5tMDH3hBGD7yYVXblphhPAYcu5/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751105; c=relaxed/simple;
	bh=BtNIOm3WFxuBN0I59Ylb15JT2dcPZJy+ODhgAT4Nc5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meka0nADev1rpvLcgVp+MtIOMJXNQyr98obwflY3lOZWqfyQr37T2Xf5Cs7XWfJpIPZutM+YjJyulImQN7J/HTpEqOPAFjD/U13J2N4i8N8SLmoDpp3XZvgsR2UGskcyt5SZQk/X2QR+kZ110efgS/+d0dGH+bqCby8PqfQJ/tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtYrMjzB; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtYrMjzB"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5eeaae02888so971950137.1
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751096; x=1769355896; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ml0Pxh1qVbQteTW8hQLYuo6bKN3PZO7AtXRgiPy9iHM=;
        b=dtYrMjzBr/MsnGPF2MLRpNWjmCIETaWoUtR4ufXkFDXRNRBUsvj1049Wr/uvBsCnhS
         1XrrVF/O9BHUoHJXxkzSpP3qczTDtGf8fn87+S533HbuoSbomC+AGD9Lr8yo8w584bBl
         5Mk0/XJx0fbV4dsRxYwGX4z7yZNANFE4vRIhtlrQrSp16dojFWhKCh2aaOedj+wj9/T4
         3uEGHGZhjG0Lpc3iUbo7az2AhLwZs1DanftZeTdAgcRsdFtIYGofBiB8mkl8ypysPd/v
         NSMtSITt+Rujl74GjgiMMvOK8HDCN18hgox+EXPcih02jl/OvQ6QrE348Z6DlgmR12OO
         pAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751096; x=1769355896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ml0Pxh1qVbQteTW8hQLYuo6bKN3PZO7AtXRgiPy9iHM=;
        b=Osfc+KEGU1TfiEkrHvn6ZBVRWOgXT/yW3qUspW26v132OOY4saT3DlaV0ULUmfyIDq
         0gfEKPGuGGA8BLhITOYgc/Up+rdxjJyI9RN+66Z6UXxAUep+EU/IlCSpVtHjwuc6Sr99
         3zGKx8t1pAjZ4/yu0fgyMCcmR6roneOHQVsD0QZJDjcIlXAngk3YjeJZRW69e026HU48
         szG8q0A9pNJl3e88U5s6VBoLIQchKVrM9uDHBpOJijeR55wC1HXMOdV5DV1giCzGIoRn
         JO54eOhVymsgm4aPVV98l/RapHnfqcaa9ZvIeFIZF4yREzDfGqKlA05/Dgbyc1j4Qv4E
         f+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVviuQ6GAeLsoGMs+JCKd891RZSKw9NxNLYkKKHkwDP8gQofwLrJzvxxHFki1Nszh0/iLTU5bU80vFv0RkSRTk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwoXXJaITObxC9nwZO6A1xc/z1GY5+LFymVqmdwa+QOSr3YOPHj
	144SbGWKsueGfvHVljeHs81yeCu76Zdc21OCvBp70vt5rR0ixOt5WYImS2vQz8jz
X-Gm-Gg: AY/fxX6LkeNW+jGCHWMTYEHPrOHIWiVFFPTM9br0erGl5pF/A6Xmo8SDlw02hjW+Dd2
	yL5EieBaGQmcWAfQGC8Pg+HY7dVdDnnTqO71bzNZFAwe9fIcWrhRwnsknCvVbTCcG2nqNP6CLWT
	+W919zNnlku5x6epKMAI81apGhV3QGypeWkqy+54aE6qL2l3q7Zq4CSwOxPYGccH2Ki5PQ25F5Q
	fgnrA2j1QEYcKmO8/CasXsUyy2GgYz+QOcdgQa5KYubtXryMHm6uw82fWrlkgjXxgd7YDMkJ07D
	8gOioKMGjWXwGPbxdUxZbQnxBkebik+vBwoG75KtKdLlZaCQMR+tSZq0Raxq9UpQYg4N4xqE5ax
	dozvvTnAb+oF16Ppoa4EQ+DuPmHCP/+1oLNfK28SUyEVvwZ5egVrU5/gx/5mClsPMTaNLrl++WM
	6cqhqSFs1pA616
X-Received: by 2002:a05:6102:cc6:b0:5db:20ea:2329 with SMTP id ada2fe7eead31-5f1a55a32demr2588543137.35.1768751096351;
        Sun, 18 Jan 2026 07:44:56 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:44:56 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 18 Jan 2026 10:44:29 -0500
Subject: [PATCH v4 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-lock-impr-v4-2-6c8d0aee8ed2@gmail.com>
References: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
In-Reply-To: <20260118-lock-impr-v4-0-6c8d0aee8ed2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4534; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=BtNIOm3WFxuBN0I59Ylb15JT2dcPZJy+ODhgAT4Nc5Q=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/z+wxcZe++GxJsk/YC7XGpWXe/l+8zZ+cni59h2ru
 cn1xMa/HaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCRmE2MDKfmP7TTmsjW0fV8
 R6zIjPcvp3xqLEyqEp6TzXadVUiJsZLhn+ZPKzel0o8i9Ztd1JdkLHWIk2hWqrXgU3izrkA+VOU
 pJwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

In order to eventually unify the locking API, implement
iio_device_claim_direct() fully inline, with the use of
__iio_dev_mode_lock(), which takes care of sparse annotations.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/industrialio-core.c | 44 -----------------------------------------
 include/linux/iio/iio.h         | 40 ++++++++++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 56 deletions(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 9693a6bb3917..83078285cd97 100644
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
index aecda887d833..f6d494065efe 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -664,31 +664,47 @@ int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
 
 void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
 void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
-bool __iio_device_claim_direct(struct iio_dev *indio_dev);
-void __iio_device_release_direct(struct iio_dev *indio_dev);
 
 /*
  * Helper functions that allow claim and release of direct mode
  * in a fashion that doesn't generate many false positives from sparse.
  * Note this must remain static inline in the header so that sparse
- * can see the __acquire() marking. Revisit when sparse supports
- * __cond_acquires()
+ * can see the __acquires() and __releases() annotations.
+ */
+
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
 
-static inline void iio_device_release_direct(struct iio_dev *indio_dev)
-{
-	__iio_device_release_direct(indio_dev);
-	__release(indio_dev);
-}
+/**
+ * iio_device_release_direct - Releases claim on direct mode
+ * @indio_dev:	the iio_dev associated with the device
+ *
+ * Release the claim. Device is no longer guaranteed to stay
+ * in direct mode.
+ *
+ * Use with iio_device_claim_direct().
+ */
+#define iio_device_release_direct(indio_dev) __iio_dev_mode_unlock(indio_dev)
 
 int iio_device_claim_buffer_mode(struct iio_dev *indio_dev);
 void iio_device_release_buffer_mode(struct iio_dev *indio_dev);

-- 
2.52.0

