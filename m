Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3436CE0A
	for <chrome-platform@lists.linux.dev>; Tue, 20 Jan 2026 06:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768890088; cv=none; b=CK+fm5+sSIi/nyXdjmdlU+blye/4vXUbIEFRhb1oVlZwJh2/cY6dfEu4FeQw7Urlg7MTuTOxHVH3plmcFqBrZHbaYDiuWGRNAB9pYdgWi0ORI3vXxMgbl6N/QnqTqq8NHgumNygRXw4veqv4LHJt8rATb/fWN2d//CbEyPOk9Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768890088; c=relaxed/simple;
	bh=R6AtgfHNFuyoDu3Dt8So6HbHkHEi4svHf3KFVpxGpRY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGbTcf0jq7ctpHMxL9juRJz1CeIsmb38r2bCxweMq2t/zNS9S0Aiisc65mGsQYNt9ZgHOQ8I8hULbH6yW7AWqIcl6SUjFCpKtqu9OOUz/UQ5bjJV6AtuV3qXgvnPlBCKTIDGj3G6RVc/Pr0SbEgObP1pzDtNqXQYpqD65PG3Mnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqpuq1t2; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqpuq1t2"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ef2561e395so3274095137.2
        for <chrome-platform@lists.linux.dev>; Mon, 19 Jan 2026 22:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768890085; x=1769494885; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvaFKco8z0TcIBUmMpdNSTwRtZj3x2smNoAu0imBUvA=;
        b=jqpuq1t2nKCifOyNNJR886+0pmBy/ZyBGgcEXn35Qoq4mXYpSS92u1/tfss6Pa4KBE
         BnfA18N7Me8O+Y58J3jKP4xO7zumsXtw7lEYntyRqbK2f/WvuwpR8ryWyQojT7fAX1bk
         QbWM82aRuztUGSBe6clsTloxW2WUoVlG/nl0IXXlauto0PljgLhq00AJchQW5kSTg0ME
         4UFKKOqy3c+c0Q5fBmjKvtSnTKbxutQHcVsjnGq6X/yuzy4o0+kyQNhMgCnCW4fDiDhg
         hqZaKepQc0TmRIxNTAl25c3ekwVYURF2b1yBx5Bw2goYSjQsZtl0ZpSneje0oJLeEjcW
         eeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768890085; x=1769494885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvaFKco8z0TcIBUmMpdNSTwRtZj3x2smNoAu0imBUvA=;
        b=LJh1RegScH/X7X+brzvgpjrjYYpbyPMjb8YfWQA/rUWos4r0gR8WwCWW6CnL35hc2A
         rxWL4mF3t1tpY/9stFYa6WhcQZzuv9DgBlm3k0zZshnvGljMghv/7TeGR2H909z3LA8m
         mA2icDDWJo4IBxsO4+lK6wlcSry/yZVneg7CdZ9AjKAPu68qbk5G1fIGhXXfMZPp02f+
         Y7Kapx3bs6MwxRkXJ8XNvYp3/BMkgBbue6Rgan7W5f0Du3D/rlGpZbszHAk5TNx/K6Rp
         etODJ3/p8C2bodocfAIEH8ll2y2sm071TasBXwfH3dK/vd89yP58q7QM2kM3FARxiUrB
         f86g==
X-Forwarded-Encrypted: i=1; AJvYcCUCMbUblyV4m8wyuTpwkTsLoN0MDQAvGx5FRbAk3yCR4UXtjLhrXU2pGJ5cWmvpephFi96KtqZabBTBEak4sZ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDYJwtI3vsKSN8pBOULAVQAMcMo5hdwr6J1wYuf6OvEJ4wvT2R
	8UUHXWq1iI2Dc72q3eUWG21//ls6owAm4Je04pzydvPJKNzWYbEcTy44
X-Gm-Gg: AZuq6aINkusqD8Pev8CBBoR696TCbHACx/d8mOyQrJDEg4PvdJc7EFtWnugpPTgUE/e
	QneFNby45M9FnEHxo7N03WH9gVF30Qn30r+ncyj3V6g13kIEC27FnSxhBO2ne2HNHE06uM60qDe
	gYFoNum7GXj14EyPjFWnv8+gbdkBHTZV3qWjv0INWNBPagAtcmp/UUc3sldZoOYHfbYuNn3sPoX
	8WvykU2ZQiRhW2vSDykN3VblAFqG3lCqjQ7RJLjDQMMArKB+ciJg6Dp9p39wtZiHAjouyoQqRcb
	uQD6fk0Vs9uOqFtNy6KMBF8Zz9gdCAbyZ8d7sEszAV0b14jcD/figdQJgfD/4c4hUzZoyr9aHZC
	nmWOKuvDRdmx6ulhQwxZuHwJybwOD+JqlL1/nIT902ZW/sjIlEORqSV7nzpt3vBFGEngLdGseGJ
	5/tBrI9/xAteS1
X-Received: by 2002:a05:6102:c0c:b0:5ed:a24:1a98 with SMTP id ada2fe7eead31-5f1a55e599emr4178016137.44.1768890084657;
        Mon, 19 Jan 2026 22:21:24 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a6900c1esm4057944137.3.2026.01.19.22.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 22:21:24 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Tue, 20 Jan 2026 01:20:46 -0500
Subject: [PATCH v5 6/7] iio: health: max30102: Use IIO cleanup helpers
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260120-lock-impr-v5-6-d4d22347041f@gmail.com>
References: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
In-Reply-To: <20260120-lock-impr-v5-0-d4d22347041f@gmail.com>
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
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJn5cld4PVkXr+ucZnJwyS918f2KXWyhifIiBqXPPnDtW
 DTBSOlmRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAEzkhzXD/3wb/gNpl18+bNt8
 9Nl/N9u7+uz7G8+HMO85r9p15cMGEWmG/9kLLLl/R1kvsVLoET5XJW8pd0Z0ekKpYf/HXzz/F61
 3YwcA
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

