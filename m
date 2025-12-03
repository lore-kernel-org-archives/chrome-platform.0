Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B2033290F
	for <chrome-platform@lists.linux.dev>; Wed,  3 Dec 2025 19:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764789591; cv=none; b=Q+1cSxApruk7eSbD4uVmoJ4/iSN47d3NvmGZTKX29ooBAuiFcwaXNpg5JAt14ozmr6zmy57HrzyCOQRPaGc4gM4xOT/TCD49r3OlyF7cbs7IBVZosHxIFFX/3tteslXXEYn55KSP5g8JfuyG4JxzxlERxzTneuZ9+xkSu8kOg4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764789591; c=relaxed/simple;
	bh=5LWmoRG7H6ScrVOX1yqApC95YUrJNY9xx2uup5Dpa6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E7Sf9fGcbuLvuEJ2zhzeqfvKyhSsQzecluevNqVj1XtWBlzivZFZn8J9pVceBVeZ4F2AaTG1nlwerAFEtrasduB+6ynCp0rjvtNNGYfnXGFO5gdRdhKAthKFz1UVJAqUFiR6vUWW6CH6gAV3/CY10aO364733Qzdnot1BCJuD0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNRKm4E4; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNRKm4E4"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-559712e8914so54279e0c.2
        for <chrome-platform@lists.linux.dev>; Wed, 03 Dec 2025 11:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764789588; x=1765394388; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCMSC4ZdX+c86qaeQmzzAFf+CmeFbnP3hRbbGI3Ok1g=;
        b=aNRKm4E48dhfzVFs7DqUgWNJ9Azbyo2cjqPxfgJWG71nAqjFMLs9+6pbo1kUzfUpL0
         gNRkdPbHbGa6myRte56lkySi6ViN2tO0yUWdOdDr4R6mMkoKWYC2Pxf5vpum51563SAZ
         xI0IP9RR/CAIoYhBlMfnLNBQ1j6vf2eFdszXmomiI7WWzi2ZqP3G0Lv3Np/6bf+eoXqb
         ZoW8CV+rCqZ4x1lkX4MzKM4nOn5tUBdn0GP+lvqvNuth62OyyZHeELOMPBWRLR+MGFUH
         irIdEiMr4lWoTMB+suTkc0Ja2wdynirCpCNsomAIS1tiVoPVAl67gcvY9GfaJHA/qX6T
         aHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764789588; x=1765394388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KCMSC4ZdX+c86qaeQmzzAFf+CmeFbnP3hRbbGI3Ok1g=;
        b=WDqwYvc8xk/wuITYxQ25yzpugBfOKo23XyZ+OghmQUk66DpTheng/1SH3zqbCbtOb7
         8a9OJdeQb1MaqDUp4vPBoVT1GeiPZ+MoPGpxRnAgskABnjb9XMZL3Aa8mUYKGBeT+Y2P
         KLSYFj4AmCuedYdPPqfu8L0tRvKqkaDLpPR1eDSYF90Gd3qApLo667+pZebndbdniMlD
         nMl7paovKg346DF0/SLIeoYTqSHzNBr/Et9chmM6ZDs3dtJ0aJriSDHIwSRH2VJPvHTl
         d9+1E2YshtuQEA+iI5e0gPu8g7IwpjQtk0MeKu4EQDCdX8+/mWuseterUkunIuzKV5DF
         yA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcG4gt6yzZxj7SZgTMC3UabjyN+PRKeymKGy5Xrtu3QPf7ZoykwifPQtL90VMe5HJZwiTBy4wFoTgey/VozTE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuTeRrzuK1u1vki4UpVY8h7QUrr2qmKIIL4pMAJsKkPzYfaSUW
	BD+MF7Kp4sYaMDD1NSKqeGIcK3KYhxEyfz6vX24WMosCD6hp3RT1OItr
X-Gm-Gg: ASbGncsi9T3Rs2/XPJFoZ8A5gi7vUJLfowD9QYhE9QDA9oA5FkQz6BWxtFkJYDwiPvZ
	vUTYv+jPURYm1e2DtQ4JqjVCJ7S9UrYVvnajbGNx0wK9/m4tZ7AQ2SRAKAMAPCdU5/IQHinF38G
	W9/oh4sZIPEa0EMlSkNJ75zCFRyvhrTu4jaaugRHgdP3feHujCrNOESlQQxGSSgSabUv7PE3nIO
	DRfJ98V2UAw4XjcykmzZM2MU9gHgd5C0XsH/1Ie6eDi94t4wKnW0qWHB08ZBF+ZyR9KtiSjqaRD
	OD9toDmcG4JAZF7jAbBY69sH3PApjYqsJ2wRHX5HNDrG5uszWXazPxUngsTnQ583fZlE3Y6RH0r
	I8iy1C75NWgavNg+LLai/+CDzJpZ1pNEYSmPIaRl7dOZMc5uZIkPVHFjq9dIRcPGlQYJrqgZnwz
	OJ1a6PKDJHu2bg
X-Google-Smtp-Source: AGHT+IFk8XZAOaH77q9ncYwj5ivBaMaGN004Yn3MrPEPkmNwBZ4+3rBREF9IL/COlAv/4FynqjfJ4w==
X-Received: by 2002:a05:6122:8b1b:b0:55b:305b:51b4 with SMTP id 71dfb90a1353d-55e69feb72dmr3679e0c.17.1764789587828;
        Wed, 03 Dec 2025 11:19:47 -0800 (PST)
Received: from [192.168.100.70] ([2800:bf0:82:3d2:875c:6c76:e06b:3095])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf4e1d56asm8121346e0c.4.2025.12.03.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 11:19:47 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Wed, 03 Dec 2025 14:18:19 -0500
Subject: [PATCH RFC 5/6] iio: health: max30102: Use cleanup.h for IIO locks
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-lock-impr-v1-5-b4a1fd639423@gmail.com>
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
In-Reply-To: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1956; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=5LWmoRG7H6ScrVOX1yqApC95YUrJNY9xx2uup5Dpa6M=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkGva7viiOPzfhv71ypcyx8xVbh/zuu3q9R7Gx8te9Sk
 3/zjhdzOkpZGMS4GGTFFFnaExZ9exSV99bvQOh9mDmsTCBDGLg4BWAiJewM/71M0p6vjLdcv4vt
 V5Z7qcrq5dobGUtLuyPP/9wQ8NdD3pThn2XZnclxvY8j6pYseu6w/wXnqoCKtXlL2hxNBQV3H5e
 rYwQA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Simplify and drop "hacky" busy-waiting code in max30102_read_raw() by
using scoped_guard().

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/health/max30102.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/iio/health/max30102.c b/drivers/iio/health/max30102.c
index 678720102f2b..c642842cb5fb 100644
--- a/drivers/iio/health/max30102.c
+++ b/drivers/iio/health/max30102.c
@@ -24,6 +24,7 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/kfifo_buf.h>
+#include <linux/cleanup.h>
 
 #define MAX30102_DRV_NAME	"max30102"
 #define MAX30102_PART_NUMBER	0x15
@@ -468,6 +469,7 @@ static int max30102_read_raw(struct iio_dev *indio_dev,
 {
 	struct max30102_data *data = iio_priv(indio_dev);
 	int ret = -EINVAL;
+	bool direct_en;
 
 	switch (mask) {
 	case IIO_CHAN_INFO_RAW:
@@ -475,25 +477,13 @@ static int max30102_read_raw(struct iio_dev *indio_dev,
 		 * Temperature reading can only be acquired when not in
 		 * shutdown; leave shutdown briefly when buffer not running
 		 */
-any_mode_retry:
-		if (!iio_device_claim_buffer(indio_dev)) {
-			/*
-			 * This one is a *bit* hacky. If we cannot claim buffer
-			 * mode, then try direct mode so that we make sure
-			 * things cannot concurrently change. And we just keep
-			 * trying until we get one of the modes...
-			 */
-			if (!iio_device_claim_direct(indio_dev))
-				goto any_mode_retry;
+		scoped_guard(iio_device_claim, indio_dev) {
+			direct_en = !iio_buffer_enabled(indio_dev);
 
-			ret = max30102_get_temp(data, val, true);
-			iio_device_release_direct(indio_dev);
-		} else {
-			ret = max30102_get_temp(data, val, false);
-			iio_device_release_buffer(indio_dev);
+			ret = max30102_get_temp(data, val, direct_en);
+			if (ret)
+				return ret;
 		}
-		if (ret)
-			return ret;
 
 		ret = IIO_VAL_INT;
 		break;

-- 
2.52.0

