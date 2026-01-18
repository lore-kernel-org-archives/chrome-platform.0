Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCB2264602
	for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768751114; cv=none; b=qQ/w920PKS19Omi18B+mlLEUtDwkfIIiWqz68DunyqiD4AsE6fpLLm8IqjtM39nS/iQuVgo40JrGQs3zjF0qFqy3CDoNm0RZJMsOCZ26jdyv3SP+I5CM1/Xhbt3E6aC3WrRyDAO5QDzXaR3OWj4o9T6DXU4t2oswHZ2nqqtH4Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768751114; c=relaxed/simple;
	bh=R6AtgfHNFuyoDu3Dt8So6HbHkHEi4svHf3KFVpxGpRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSNEar32xOgAv2NhthnECt5zzHKUm95DbKxypfd7Uz8wi6bK3Sa08jyQPyB1fKeUZBjZvh9gx0eoQBvmW4bLI9COqwfhgzwCe9L+cCKW+G3VuSYJNZ7clpP1AOy022u96amWRBlZ0VpcCp2+UhmKgglozxdNGTyaL/dt2MPzroU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JP0WW9iC; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JP0WW9iC"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-5eea9fbe4a4so1282638137.0
        for <chrome-platform@lists.linux.dev>; Sun, 18 Jan 2026 07:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768751106; x=1769355906; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvaFKco8z0TcIBUmMpdNSTwRtZj3x2smNoAu0imBUvA=;
        b=JP0WW9iC5+tpJct/NNFsMAWtcrlSeI9wDXKnQZI+yPjcu+Zp6BAqPRdDYbIY3t8S3B
         XxQYpejiJrWoUGHhnsYIjRgKsB3Le1oIpi8yLWzpxSNENkkNyT8D1a7a4ter77vivqHa
         1jfOgs3SC31sOVYiefGKtH2rka6oUszSLSBl3K71aALR3CXfrniw2c1caVUi5Jfh7rET
         OysMhVng85AmhvMjcrd3Naqy01FH2Kf9jey9v5F8mD95vZa2ksWav5Vt46/83nnaCFce
         jFrHW8DgiCIMs2T85Ad80piRWDAeLLOtwT9QuUcBlxnit3QssTMeZF1GFpy9Gzo0CIxK
         kTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768751106; x=1769355906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvaFKco8z0TcIBUmMpdNSTwRtZj3x2smNoAu0imBUvA=;
        b=fOwgLj+64zVfpABCIFWSfopvKzMINboWoP/vm8p8C3HN0oevAga/Hw+u/eCH/tZOT7
         oCtm8f6Xhymp+lqjEsEi7l3yezGqjm+vW8qvtdFYBIQ4xwywX6c20hRLab/6oUV40E2G
         1tYMRv1M3CfdKn6NgnrDfI9qVOWJfI5c32jLtLn9JXMy6EMCMPO0ZELuN6mJQsqdMCq5
         ShaPh/Yp/TXjtoj6Bk6nC5Uasf2Xk/yc8qpw+9vjOHGCLmnpn7T4Z6MZUDcxymvSJzlF
         RP0Rg9TybhuJJIIMzLerj8zWsQb+msIoFya6eI7cTe6yjuqo71kbpZyfgJFrpXN5RXJa
         JCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEqFtDI0DbZUi009LKw/KUa0TqfTL9zMDJ+8IvwRBqivv2AXNe+f6kgdpRGb2ezxKUf5koEJDn+E24zMiGjxs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi/DH6tWqaWJeTk6bBhTbXBwYboBlF5lrmkr7puN+AAT1M9UoW
	xGUiWyVV33QuXkFBdk3jB4sHgjMelqM/0AFbLakFh15s0mzRqMYy9/EGHC4b08WM
X-Gm-Gg: AY/fxX76tTZSO6UjAD7cV6xr7h0F/49SsZesM6XymrnWRdBH1/7//9/dxJ0SUvs/dpj
	zZ2lvtdBmuJsY8Y7n8ElLhjqHYBU8y3nt54+OFn1my+FXU9cJaoWi57YS0pvjn2cLvVWmPaD24n
	OKLdcZG/3cIx0ahT/ypBTcl+VHlJG+gOjSuO4TJvmkFKPZrfnkL7lTGCl7XL6ihMCcXYi2NfOkN
	2g/tLq2VV087L1URAl1rLSjyqrEy3I27yk2PzX1lAUK+1iT8V5bbYB5QSiye6T7SQqNVh8xW7ph
	obFmbQEpG/cLme9Q8xQ7bMRpwcy1Gsa+OwzpvSrYxTqbm5PlG/dzMEDAEPKjQMINoighFwWBsZF
	E6RtGkRgKVnfelRDQKEMRGbe+Y/POZZrmekSkvX85mTlMwO3MRQuQbswERGfIHHEEgyh6UvzwPK
	CUQjEoiOjKMVzM
X-Received: by 2002:a05:6102:54a8:b0:5e1:866c:4f83 with SMTP id ada2fe7eead31-5f1a558c2e5mr2344860137.35.1768751105696;
        Sun, 18 Jan 2026 07:45:05 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6d3ca2esm2832731137.10.2026.01.18.07.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 07:45:05 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 18 Jan 2026 10:44:33 -0500
Subject: [PATCH v4 6/7] iio: health: max30102: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260118-lock-impr-v4-6-6c8d0aee8ed2@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2086; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=R6AtgfHNFuyoDu3Dt8So6HbHkHEi4svHf3KFVpxGpRY=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJk5/z+KsaetvqNpz/Jty55VRR2Fgt/erzJ7WWW/qmtL6
 owrzOY2HaUsDGJcDLJiiiztCYu+PYrKe+t3IPQ+zBxWJpAhDFycAjCR83KMDLN6GFbuZXgb8nTK
 hNfPlVgneCdYrJYODnP+lLol0mPd3R+MDK1liWf0Ek7wrZlqLGdVseJgb7CSX1n61T05E3JfMhT
 f4QIA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Use IIO_DEV_GUARD_CURRENT_MODE() cleanup helper to simplify and drop
busy-waiting code in max30102_read_raw().

Reviewed-by: David Lechner <dlechner@baylibre.com>
Reviewed-by: Nuno Sá <nuno.sa@analog.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/health/max30102.c | 33 +++++++++------------------------
 1 file changed, 9 insertions(+), 24 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index 6918fcb5de2b..47da44efd68b 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -467,44 +467,29 @@ static int max30102_read_raw(struct iio_dev *indio_dev,
 			     int *val, int *val2, long mask)
 {
 	struct max30102_data *data = iio_priv(indio_dev);
-	int ret = -EINVAL;
+	int ret;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
+	case IIO_CHAN_INFO_RAW: {
 		/*
 		 * Temperature reading can only be acquired when not in
 		 * shutdown; leave shutdown briefly when buffer not running
 		 */
-any_mode_retry:
-		if (!iio_device_try_claim_buffer_mode(indio_dev)) {
-			/*
-			 * This one is a *bit* hacky. If we cannot claim buffer
-			 * mode, then try direct mode so that we make sure
-			 * things cannot concurrently change. And we just keep
-			 * trying until we get one of the modes...
-			 */
-			if (!iio_device_claim_direct(indio_dev))
-				goto any_mode_retry;
+		IIO_DEV_GUARD_CURRENT_MODE(indio_dev);
 
-			ret = max30102_get_temp(data, val, true);
-			iio_device_release_direct(indio_dev);
-		} else {
-			ret = max30102_get_temp(data, val, false);
-			iio_device_release_buffer_mode(indio_dev);
-		}
+		ret = max30102_get_temp(data, val, !iio_buffer_enabled(indio_dev));
 		if (ret)
 			return ret;
 
-		ret = IIO_VAL_INT;
-		break;
+		return IIO_VAL_INT;
+	}
 	case IIO_CHAN_INFO_SCALE:
 		*val = 1000;  /* 62.5 */
 		*val2 = 16;
-		ret = IIO_VAL_FRACTIONAL;
-		break;
+		return IIO_VAL_FRACTIONAL;
+	default:
+		return -EINVAL;
 	}
-
-	return ret;
 }
 
 static const struct iio_info max30102_info = {

-- 
2.52.0

