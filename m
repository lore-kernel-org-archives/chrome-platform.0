Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043033B975
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751097; cv=none; b=lI14HlswVFPTdz6VeLbIhEiIAHKnSYM7+Tm6e4XiluWsaIK1Dxo4YFpwzAfm06U0V/PTTepeZ5i0pxG6jRsdk+/zcqnBkrwBMJVoOPtmLLQEw8kpCoLLjLjvGmBvQR+vcyohD5mAWk7E9lT/m6JQpqWe70RbDQCA1JVuj/jrSNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751097; c=relaxed/simple;
	bh=V5GRFxOK+CqYOqKjTag3VDmILaHUud2L5Y/Wvb3b2ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ah61e8Eq+RPsWC213wgiVuHPuI05R3jb1jgBATCpWeWD4rn9ZYkd6h4gl+W0W1nA7Prev8YLAp4AnH1XGhTstIhIrvLkVCXahgI9TP/8gvJIOHVOEJ+lKBSr/g6HB1illfjpGEavw5eq/7imcxULJU/QMoEpcwMEe50Xkshmop4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDLWbcY5; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDLWbcY5"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9412cb281acso1090707241.2
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751094; x=1769355894; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6CY6gggGU9QCCuY3V8jLvoji+Ol4m8zqn3+Qzz+4w0=;
        b=UDLWbcY5JI5olceuD63InXq50f8Qn7UIYJkmYX/AF2cajImT5CxkR/wpM7exZRvS0Q
         Ss6DPJGqAY5XEyP9U3UePeMvSbeb36cEGWU/hDCN0Vtm51SSPSkXTDEdebkex6xN/ShN
         mp6VTxVSF71cLU/uaBLbk5/AGp4wnvx/ROZnnMbo207+yVfPo7JaRphGTzkwKUSsiZV/
         4p2bXZeiaPQCE5/EiGjgUIinKm5LK1imVoYEf+NMjGv9Y+elx3rI47eVVWGT9dGJY9vU
         wWz4QO10UcO8Sxk/lrT0Wbc6gCiTONaOnj2tsgPbcTp7bOdGK//qMqNyIe0swoitraBA
         JK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751094; x=1769355894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6CY6gggGU9QCCuY3V8jLvoji+Ol4m8zqn3+Qzz+4w0=;
        b=pYeLMe45UZrYt72BnhlLZKWDj8W8J+zaJaitFE0HJfnPwJOnEyHUbPDx8RUc3isseN
         I4ZoHFHhqRPwFmCctyjiRtP0zJnbDp/a4hsYe6rXKbLg3ayd+VF85UnLqnG1o0ZQV+g2
         2nPa7y6CLBDN/ol+liJs6jBEbV6O8R9LGu2i1Eof3stBTnKDhx+dOSnwf3ZeKU7wEMPA
         rrOGfmQxALMXcyXdlUgWgN8iJBGCeRFdwQkyd4L911iANdyoz7V56Cf7wlFUoJua3+sc
         TvjeuVtEut4WhvS2C0YoqqeycjjX06p7Xrg/DobgrkR1KRuZ46vob6amtZFoITwV55+d
         FhTA==
X-Forwarded-Encrypted: i=1; AJvYcCVyIt8FwpqAvdH7ixTInEY22TOimuVA+4tthgZ988IRhVqMaJUQdXMNNmipVI32AbcTiuC9i2ZBOzNsMj5iTKE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvPg8/mcuZYq0cXiWapax7kqxQ0SkhDJYA6ibuThyamkvo51gf
	p3JgD7ApMQdFTC2SOVQ8/jkii+SdPttZC2EV0kUJ6Z7VoR2yyp/z1SCYRy9JTgoo
X-Gm-Gg: AY/fxX4UhFTkV17QTLystA55K495fPeL0uL2YvmfF2mrF0zlCCgIQeCo2rJR+w8/N0U
	X4eS5WYhSsgyMRDASVLxa38akpX0Px+iAvEOQa36GnLOOw+rbxarj6saEUFFdsjoR922ShbKrqB
	TlztqWpBDHbkd8rUE9QmMNG+HeYDds6Zmix2NiXk+lT2m1RQhuS85yiV//MuRiN8vVycD1BxSYI
	UQ7LwA1Y3Ai5wbD8/f1zK+KZuf3KAFAn0Fa5BTpbmd3SoxH1+VILy+lZ06e4JIN/lBok2yvKFKr
	+eejskeW5kMGyzcSLNlJSsVv3I8JvTdKAW8tLitnR2FHGb1lg4AtmvUqYa/scTH5EqE5UEdJHDf
	3fUHf+bM/nf9oJ/QWNvGkYNDYHRThZBmHxIiEcSUDzRr5pjfHwGepdkuzcIpbDwkV4duMUzx4gm
	anS5/tn8zNVWao
X-Received: by 2002:a05:6102:5109:b0:5d5:f544:a88e with SMTP id ada2fe7eead31-5f1a71b9607mr2391425137.35.1768751094087;
        Sun, 18 Jan 2026 07:44:54 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.44.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:44:53 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 18 Jan 2026 10:44:28 -0500
Subject: [PATCH v4 1/7] iio: core: Add and export __iio_dev_mode_lock()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-lock-impr-v4-1-6c8d0aee8ed2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=V5GRFxOK+CqYOqKjTag3VDmILaHUud2L5Y/Wvb3b2ns=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/z8sc/oo426zjDHXauYmqYyS97EeL/jsHxnmBZ97X
 znPpHBxRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAExEO5GR4Unwj3N67c++vLfs
 nMpTKrZhudQD4c9pEl/YIiInteix+TD8Mzy+0LlwaTZz3fKHAl2zj+8Jum72PuukhPjN5mm/7Z9
 lcwIA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add unconditional wrappers around the internal IIO mode lock.

As mentioned in the documentation, this is not meant to be used by
drivers, instead this will aid in the eventual addition of cleanup
classes around conditional locks.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/industrialio-core.c | 30 ++++++++++++++++++++++++++++++
 include/linux/iio/iio.h         |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index f69deefcfb6f..9693a6bb3917 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -2171,6 +2171,36 @@ int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
 }
 EXPORT_SYMBOL_GPL(__devm_iio_device_register);
 
+/**
+ * __iio_dev_mode_lock - Locks the current IIO device mode
+ * @indio_dev: the iio_dev associated with the device
+ *
+ * If the device is either in direct or buffer mode, it's guaranteed to stay
+ * that way until __iio_dev_mode_unlock() is called.
+ *
+ * This function is not meant to be used directly by drivers to protect internal
+ * state; a driver should have it's own mechanisms for that matter.
+ *
+ * There are very few cases where a driver actually needs to lock the current
+ * mode unconditionally. It's recommended to use iio_device_claim_direct() or
+ * iio_device_claim_buffer_mode() pairs or related helpers instead.
+ */
+void __iio_dev_mode_lock(struct iio_dev *indio_dev)
+{
+	mutex_lock(&to_iio_dev_opaque(indio_dev)->mlock);
+}
+EXPORT_SYMBOL_GPL(__iio_dev_mode_lock);
+
+/**
+ * __iio_dev_mode_unlock - Unlocks the current IIO device mode
+ * @indio_dev: the iio_dev associated with the device
+ */
+void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
+{
+	mutex_unlock(&to_iio_dev_opaque(indio_dev)->mlock);
+}
+EXPORT_SYMBOL_GPL(__iio_dev_mode_unlock);
+
 /**
  * __iio_device_claim_direct - Keep device in direct mode
  * @indio_dev:	the iio_dev associated with the device
diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 872ebdf0dd77..aecda887d833 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -661,6 +661,9 @@ void iio_device_unregister(struct iio_dev *indio_dev);
 int __devm_iio_device_register(struct device *dev, struct iio_dev *indio_dev,
 			       struct module *this_mod);
 int iio_push_event(struct iio_dev *indio_dev, u64 ev_code, s64 timestamp);
+
+void __iio_dev_mode_lock(struct iio_dev *indio_dev) __acquires(indio_dev);
+void __iio_dev_mode_unlock(struct iio_dev *indio_dev) __releases(indio_dev);
 bool __iio_device_claim_direct(struct iio_dev *indio_dev);
 void __iio_device_release_direct(struct iio_dev *indio_dev);
 

-- 
2.52.0

