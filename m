Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59AA226CF1
	for <chrome-platform@lists.linux.dev>; Fri, 12 Dec 2025 02:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507537; cv=none; b=ltlkPR30QqggMPfR/dl6ou8stTXW7Kffqa3Lf8UNJLXlpCMSlkNtFv/xwjI+W5tgW6+oLcEWLGK7moYYl+QejQLN+Af+/F4Z6pTYG40LXy3+UpLPWGx7B20qPIotkH9nbc6XjLe5pw2MudCPqDFpDd6uAA9c21V7A7+nylpCgFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507537; c=relaxed/simple;
	bh=ZyZf8TO7PzHx7g5RugMBOmjIDzgzIBX1y6ZRU4DbrOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h38t0iPMR+MQtRcuPxNrTNxZqWYr5jTg2ID6cQ8tIbqpJsrqNqs1Af43QYAbercjBblbJF3Ab8g3xvdq2RwXRTijbTFY+A106BwbkXMuBrq7JBub95z1YRcqsch3GktdEgfNFFFATOeb2s+cKOamfmVBLcDQerQhjiDGiVU87LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlzqYT0Z; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlzqYT0Z"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5dfc3c7de2dso534063137.3
        for <chrome-platform@lists.linux.dev>; Thu, 11 Dec 2025 18:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507535; x=1766112335; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FinWiyCFvPunbe27vbfgs550CHQE+u+zy2oBmwPsfB4=;
        b=MlzqYT0ZR2P7ViZzPXsz/r8reWkSeHfX/L6WYrim0A/msqxBtFhqegVrdICotRfLga
         Sv4c1DFLwo6JTJ4s8qnhLn6ZMz1C+EycGCpzL4eHnBjjoLwQ4Vm0HM1T8CFr6TMrOi7H
         gYjb7ugo7NWXnBwuzGeINxzUYXL3GmMkpJp0S3AahGMXzBGbezJXM4Fh0QFXkEFUiI9u
         D0aDsWOHb322PMS2yJn8noc+9NGRPljdcq4vyxuYwtvn0GCob/y1n5UVtVYQsoBg6QQ9
         iObVXqr97qPi4/0VX3PL4kjdBILR4PmplzRkCzhl3jeLW+wZL0dDZozHiuxkM9Dmznhu
         0zbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507535; x=1766112335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FinWiyCFvPunbe27vbfgs550CHQE+u+zy2oBmwPsfB4=;
        b=TLpwb2C76g/AmYYxuPLpIKJwsmmPjndrk8xDoJkzOBSs2nsPG+HdJXax/qIA1ABwKL
         eUpI1C5boTZMi+kLhlps+7rO3bwh7jJ6RXFicTjAFYq6uQu1P+mBQPUnUBwoTSkcmhjY
         HXLRITl+p7a7P7TArnFJ1g/b6b/thxbohjXrMA4eEFGXq8rXW77QxjNAn0EN5G9MRkOE
         F76VG/gt46MAc68I+JB13kt7j+spGh6PUDGd5Suu1fJfAu89VdZRZdLGkrfB8WKTlvrD
         lwAijW5NHXByPsUTWRrM3xucie1k21VM8Hn7tqp8B3oKEiw8A0uYi6HtXBfNIALhBn04
         fllA==
X-Forwarded-Encrypted: i=1; AJvYcCW8X9iU11+ODpEDIrq9diCS98c96S8fkw31LCeTyr+a92frsPAai457GZm64nqqZGxWJVXBKzTqihpRY39CdA8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJhPB7Y+rqOa6mU7QK8qmxDC0pJvGdKd0rLiZpo4I93HpYGg0b
	1wHtLuabH7gNWCLIRu7n9pWtSYIc/JVwWCYpr90Dwvgm52fLlHRMIbgw
X-Gm-Gg: AY/fxX7kAMqbgBUgJZMwOU5dsTmAIbiwbFFRve+Kt6nL1NIbm4mNuYaz+iQAdCq1wQ/
	qvBpySNJVOEK2+4WKxmiRg67lFJLJu/orlSZ4H6c7uIGUBMwZvuW0b7DbUwf8iHtYLCBT14TYhm
	jZMpHjZSRABRkz+1OdOb8eC01yTwfgAjEVuS8G+w0ETXjcXx0C9N08yTB1gy2Jud2XjQk+MSjPG
	jyZG03bPu2ONl0b7F2+NQJT+RshnDMNlVAH1hQ16kCUAa8kg98qNhS3nluQNRtkin6dgBoOfLfA
	noAtGeUn8LNTmKuLbgy06ySCiEiTzCMfAHIsqIVSE8X7seXAVDEfBrwK/Q04lduDqnW/Ik8ESEH
	molvynShibROz9R6Pw1xZ8qIsoLLMMQvSThEHQAIg32KvivASVfNr0gyzTAoPi/OPsWBl3VfGYw
	94Tt5E/dQ5JRePeXRSZLf4H0k=
X-Google-Smtp-Source: AGHT+IF+ceBiyFMTLRWeRyVASsqKEDmZHzPSVx4bpNR94n9cZQdZ6LN/jPJOWf4xmhRScVw1fNAzfQ==
X-Received: by 2002:a05:6102:e0b:b0:5e5:6221:c5a5 with SMTP id ada2fe7eead31-5e827471559mr131690137.9.1765507534762;
        Thu, 11 Dec 2025 18:45:34 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e7d0f25ce2sm1693762137.8.2025.12.11.18.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:45:34 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Thu, 11 Dec 2025 21:45:19 -0500
Subject: [PATCH v2 1/7] iio: core: Add and export __iio_dev_mode_lock()
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-lock-impr-v2-1-6fb47bdaaf24@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2754; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=ZyZf8TO7PzHx7g5RugMBOmjIDzgzIBX1y6ZRU4DbrOU=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJnWjSeFLp+8w63AfWhP4Hkhj+5bBwSPez6VkFLr9zx46
 tPMyhqJjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZhImhEjwwcRkZBgpfYy4eIt
 UjV3Fr5cftz0nBKD44SJ58KDw5f2pTMynGpay1dok3bNxvpoQLqt0fTqopYP3Y7XTvtePduxZLY
 dMwA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add infallible wrappers around the internal IIO mode lock.

As mentioned in the documentation, this is not meant to be used by
drivers, instead this will aid in the eventual addition of cleanup
classes around conditional locks.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/industrialio-core.c | 30 ++++++++++++++++++++++++++++++
 include/linux/iio/iio.h         |  3 +++
 2 files changed, 33 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index f69deefcfb6f..1cce2d1ecef1 100644
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
+ * state, a driver should have it's own mechanisms for that matter.
+ *
+ * There are very few cases where a driver actually needs to lock any mode. It's
+ * *strongly* recommended to use iio_device_claim_direct() or
+ * iio_device_claim_buffer_mode() pairs or related helpers.
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

