Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9019C195F0A
	for <chrome-platform@lists.linux.dev>; Thu,  6 Jun 2024 13:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717679539; cv=none; b=Du43/g+hB3f528bkWGDAad64tskAr1ZofOWY9j7WuB030PazlRnixF2knCpWZhZsLIBZiuPw1sswjfxeRMGA1KH1rJwH6hiOvJDh7Slrw0lds/XfSMlhCTvML9D9bW79s2Ybp4EWWMptNgw1D1sxY0jxs8B/UWjg/Vf+l2i2MqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717679539; c=relaxed/simple;
	bh=me6Ty41cRCSnMOmdHM0XNnCYCzQRzAGcL0KUR6aAOg0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNTOXHtq6bIg/1/Dd/8kMLzHpNTfRe+l+WECbfElPvwn+LluRmDfnODRbhO282rg2zai+z8cT+JYfYau8EYiU8E1UaiWoG42G6sumlrJJuBo1TBAWxnuIB4UfLaPIR4o7iUIjfSSfQ+HpKT4d7tDlKbw7dSKvSlIfUCDFP2YuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V3oOokNh; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V3oOokNh"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a68ee841138so115733066b.1
        for <chrome-platform@lists.linux.dev>; Thu, 06 Jun 2024 06:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717679536; x=1718284336; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PxE7l690bffTKUzQL4YoKYab1ziPbqqN+8E58otRGxA=;
        b=V3oOokNh0OXd1c9DqBp6+ZWcq3K+7jU3ZcIBGGYxfdTOpqa/pbLBUYI0rXF/dChwzt
         eQ0G9hXS/7cq7i7JIUmftNVPxLHaaXU+hDaSwx08hEEpY39KYQu+xRoCyX3Hcj09bG20
         xyHC08G8vhsPY2eyq0rqKDKq3GTWOAnZkmJKP5AsjEoqFbvC1VIyNK6V6gFtv/WIPuiq
         ID/8XcGbkUJmZsEujkUnf3VNva5rKU7UxOT3lvVT+TVIbwIBd9YU4Wxfja4EI26aatKe
         OZ9025XSMO2fV0+3KWf86lFaxQV5wIrhLXLq+WSrehdBJ09V56N8qm4rHM7EFQ2/H+AD
         9jJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717679536; x=1718284336;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PxE7l690bffTKUzQL4YoKYab1ziPbqqN+8E58otRGxA=;
        b=BkCwtQQkMfIHQp3MKJzgbzPLJySF5uCQSBd1BD3xBy1kU1aw+T2TivgVb2gtt7YL8D
         I1+13RgdjWhhWV0cqNC4lG+iVa3gMaYtk3CN5/BtfH9dHvPY9zcZoNnXzgGd1TvTEQJr
         fmBIVHFBG4jZqLrZAK0obUmXcCdoPSZ2mEK9PKXZCJIIT6Hyia3vYW8Ekr7FbbEui4NE
         LzEEd6UrZLp1xsgSUp/nrTdLJZNJR6V2e63SjiBUzE+IVLJusx3guOO4WWIo8lhreo47
         k5lTkbp7z1bCQ2enROtEFRgUrHSEGcJOeZ8bkqERR9Phd8g6F8ZwNlNx+MJZK/pm25j7
         FyUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpqHt5J2sifeghlxwn6Z6tkyG8xwROvYRul9UlrcmJTyfNXlmk7IzoYRBKNqaFO4WNHZaB6zIczLpcmXC3FTZnn31JG4Kfm13XfuRTN/dj
X-Gm-Message-State: AOJu0YyT6J2J6//RSV/BsM0ZYXLU2YT75HJp8we0i4DdzSi/F1tU4aFV
	X5bz0Fevi/d9QZeE1D9FKJkKu4EwKPPjNGZlEImbgpZGJHigDkwRkXCup0Zr6sM=
X-Google-Smtp-Source: AGHT+IEz8YfL+SCPuHJF+3F2Q+2LZ4go3JrKNs5304zCp0iKQZ2Bs1sP4ET868nj7mSwau9p+NP6xg==
X-Received: by 2002:a17:906:390f:b0:a62:5ff6:c728 with SMTP id a640c23a62f3a-a69a025318amr374676066b.76.1717679535821;
        Thu, 06 Jun 2024 06:12:15 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6c805ccb1csm96890166b.80.2024.06.06.06.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 06:12:15 -0700 (PDT)
Date: Thu, 6 Jun 2024 16:12:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@weissschuh.net>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (cros_ec) Prevent read overflow in probe()
Message-ID: <42331b70-bd3c-496c-8c79-3ec4faad40b8@moroto.mountain>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "resp.sensor_name" comes from cros_ec_cmd() and it hasn't necessarily
been NUL terminated.  We had not intended to read past "sensor_name_size"
bytes, however, there is a width vs precision bug in the format string.
The format needs to be precision '%.*s' instead of width '%*s'.
Precision prevents an out of bounds read, but width is a no-op.

Fixes: bc3e45258096 ("hwmon: add ChromeOS EC driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwmon/cros_ec_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
index 41f268fa8260..b3ba7247e06b 100644
--- a/drivers/hwmon/cros_ec_hwmon.c
+++ b/drivers/hwmon/cros_ec_hwmon.c
@@ -212,7 +212,7 @@ static void cros_ec_hwmon_probe_temp_sensors(struct device *dev, struct cros_ec_
 			continue;
 
 		sensor_name_size = strnlen(resp.sensor_name, sizeof(resp.sensor_name));
-		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%*s",
+		priv->temp_sensor_names[i] = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
 							    (int)sensor_name_size,
 							    resp.sensor_name);
 	}
-- 
2.43.0

