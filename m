Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B64318133
	for <chrome-platform@lists.linux.dev>; Tue,  6 Jan 2026 08:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767686837; cv=none; b=QHSQccrMJ2OzPMKeS0HsbeeGNWb5Jk/csdcbDKwz07FGlNtzwhE66qU5Mjp85piaPKjKMn7EM3LX/7hpoy2ZJ7+kxqB2dDVWVbK2b7Q9Fu88JcBQzRLx8Uf82syaeLoBSrXXPm18yKFHa9iqrsf1BuiKtOUnGncnh1rq9UkP56Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767686837; c=relaxed/simple;
	bh=SDNvhXmYISbhRSNXw7cDf8FAaBgXfpTb+CF9dLnc7po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwnNQ6yYWQyHeMB1VOc7RlBDkLU/0BvxKYspwnYymsDgVxi3v7ZBjoNPGfCklSteI1FI141R3h3Vjr0y38B+IibAu0m1mtctIAEDc6ffL+tY4ZqUSwAzv3vrtHQ564QiJolSLRbmwnY9VG36jMiy1B39ctuSJ4OzULvmaYogAJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+3I+C/R; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+3I+C/R"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93f500ee7b8so328616241.3
        for <chrome-platform@lists.linux.dev>; Tue, 06 Jan 2026 00:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767686834; x=1768291634; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWotJTEaFvNIekml25wC2h7Cy6W17ZOWtBn2DgmBWDc=;
        b=I+3I+C/RgrdrfVYYKWlKCuY7f3/foMOvmSjMaY3gmsDRqBx9BnisP1ki5aY5I8+8sP
         09BpSflNCFVDsb/2okCcVWTaI3mp+/R2jSJ0zWZGpFf+hQmUpGkKY0nEdgzkccIOF8Rw
         fshdzxdjzO1vaObattZz+/S8Sc0RzYbBHkQ2JU7/fkmbV8/LDZxDsh9FD8Tn3fRA6L37
         FbhzDKauovBjGaqrPO023LdDxTDMcUN4Xsq7oaKbXIDQjBEAQlokX5ZccUHC+J3wi0FD
         /zB1Q/hoZf6CCnr0ImFqXUQ+5F8wvuglVTeKC7vJooIyw5i+6ojsMD6FVRaTXwpEswsy
         8lKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686834; x=1768291634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWotJTEaFvNIekml25wC2h7Cy6W17ZOWtBn2DgmBWDc=;
        b=IwzI19IVQ3yBC7aMicAvcUh0o2+JM9OCbtP1ELMgv4RHEWMbPbozrDHxYPoI22GEOZ
         h58yD6T6QMras+qslyLXTtLNb0WsN32QrrmjczI3qNfdTboXRA2gWN2nHMsTIl8YBTmo
         CdBO6T1HZ8lR4TTVmQw7EvPltssKW4WknbpyuGIlmV2R+FmCs9tXsetiB+hYeZxjiWGZ
         FqB3GJ1Tlp1QVCdwkbdNwVixFKjlZzqjyfygaTJ+xo1e6lB1rwb9mbESZjaBqN7DXX1E
         mgQPjhvbq+B+M1GjPfGf/IEKrzKRns7D6JGR2zcqRmxlGa8k/fCLXma5wYjSBx4FU9wv
         cn/g==
X-Forwarded-Encrypted: i=1; AJvYcCUozaQhhUqQrNZ7tGJwrfth9a9NE4ET30CWkW2GdUjpncBlNYN0Lt/iHHYuDsvQfR/UCXxMpROdWAUeK4cpx6Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfqaKR4JIER/1ux4Cy5vfxo6dqi6zRbDPgAkspDwJOa1lbkYZn
	v0L7i5VDILiefS/hiKnPq7libfekWIPkh0dirZmwcsi71xFoYG+93EMQ
X-Gm-Gg: AY/fxX6AoAY1UaVgFo/hyL26DDgPXJxLklVEMtSPY5aniXw5vwT2uu3+GwhrzSkGYaW
	Rud+qBpvq4z5bTWovvKiY/E5FVArua052MXhEcypnU38F+UowvZXcdVrexAU3VGFN3Ctvgk00B0
	4axj0VmuA/tGyAVWkdremvCRLQu/0avLeYxG1czW4+oE4O94kbok8RPiRK9Gub2ZLnQ/n7pSycy
	HEywPeL5IohyMF2Ai/kLHCa9Etw2THWsp8gnrAoKF9XPiSR64yPokPdmGrXn6Z26dywDxRzJsj+
	cG7p2H803sNkxIxN2UuSb5h9yC2zTmAMtChk6XgAA5qie8jol0yOB6l1jbvDPFa1z3+ZYjqmpSl
	r0GvxXdrz8Uv+RqpBeewTeXOBmLQZYAhNbtwmj3/nKniDZkxeFBjtd8LXcKFiw/xnBxXAVLZIKS
	eV7Y9FSOHvSmSA
X-Google-Smtp-Source: AGHT+IGdGpTqIyt6hEQbsRf4knYcrGeXLv4/KWJlDSNjEZ82/dMx8V7fOF7A+vNwmyfIMdeELVkxhg==
X-Received: by 2002:a05:6102:291e:b0:5db:e851:9395 with SMTP id ada2fe7eead31-5ec74324f6dmr661509137.7.1767686834136;
        Tue, 06 Jan 2026 00:07:14 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-944124a3386sm457615241.11.2026.01.06.00.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 00:07:13 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 06 Jan 2026 03:06:57 -0500
Subject: [PATCH v3 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-lock-impr-v3-2-1db909b192c0@gmail.com>
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
In-Reply-To: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4435; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=SDNvhXmYISbhRSNXw7cDf8FAaBgXfpTb+CF9dLnc7po=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkxh1btC1q6hjGk42Uke1pnXlPVg7KrLTkBMuk3Q7Ib2
 j+X5J3qKGVhEONikBVTZGlPWPTtUVTeW78Dofdh5rAygQxh4OIUgIlksTP8TzaYnGAXZF+be6jZ
 yFJsZl76M5nDz74/DuOy5ZuyuGp/OyPDmYz/MY8n3by1wvHTzz+SvEobm4ItvR9u3v3ZJGDHLf8
 PXAA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

In order to eventually unify the locking API, implement
iio_device_claim_direct() fully inline, with the use of
__iio_dev_mode_lock(), which takes care of sparse annotations.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/industrialio-core.c | 44 -----------------------------------------
 include/linux/iio/iio.h         | 40 ++++++++++++++++++++++++++-----------
 2 files changed, 28 insertions(+), 56 deletions(-)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 34867a860a84..550d100d9cfa 100644
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
index aecda887d833..3cf340208694 100644
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
+ * can see the __acquires() and __releases() markings.
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

