Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736EE311C35
	for <chrome-platform@lists.linux.dev>; Sun, 11 Oct 2026 04:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791694461; cv=none; b=U3QOZL3pVOD0rFjlEJXpWFLtAR8HLWkMY/aRjXwkdtyJocXILXhuxgDcJ9ZdxJSm60dnRhckMM4Oct0TkbH6slNJLQYnBCi6X2b8co3NfUITPLqx/YJixidocdJD0r2j/PwOSnW4ZxwV3AtKVFV/Bkj2MX3u+O6zWlH883V1db0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791694461; c=relaxed/simple;
	bh=PajRC5vUMiRr6CbTVl3zKRdEDLQRI778cFy62JClji8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTpVOKkXrkK5d7P0JYHJd0YKSIbKoMMk5lb0k0M8T3CQViB1c2ZlMS3tEf4MteivxLS2Q3/YR133S1huxfhvQ66nO8KRwoe+78n45FtDzd0jwAahn+ve/RBvJGAB0o0oDr0bSnBXF3yLQEYCevHF7som6HuJC3G24Z3u6MZaSvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sJ9o2Zu7; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sJ9o2Zu7"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so1216381eec.1
        for <chrome-platform@lists.linux.dev>; Sat, 10 Oct 2026 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791694458; x=1792299258; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=auMfHamRfTcV/GZLqeZ5Y5LbcqKOtpZq3cZN7xkwVsI=;
        b=sJ9o2Zu7PQowY4mog3bB4OWFBrmPSoR1gFViI1rQPAiGZsyFbQ69kqtudu0wU9na5t
         YjCynym9QPDCxXdQKCmhG45BLtFc8HXWzXcJ+vfjrA8rjJ3RmSBSuJo40PinyhJGliJI
         e04wvUF7rAiTno2ONAIPgvURCphh7ORg8Knzp1JANRsLoIyM48eeVHhCdiwOjponEMy1
         1jmlV0T5rqkLWay8sxqw+3dwXyHo2coFRqe0UrP59PBV1xUohaXNN2XBV/tuz5lR1BNW
         bRyKa8ppvQIRfBcCAxE9Ty61D3E6ss5pLfpVm/05/2wGVh8FjyHgSclcsVBJMXJgx+9f
         DYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791694458; x=1792299258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=auMfHamRfTcV/GZLqeZ5Y5LbcqKOtpZq3cZN7xkwVsI=;
        b=EUxc5bB1l9q4ETDphAxwpZkhqk2SxACW9/ycDGJEFlgV1Bip6WGjhvyidxWysVrf+/
         5NI8/uyca4i+IhIPBjRjeuxR9XhsfoG4407Jvgl4EXsUZ4YyFHkDftmC324YuSdvVBKP
         h7/S/WCQwU7pkWXDV1nWUtTyBtUQR5ltZuB6HutnVTsjb8rjJfmAxcBv8PLtVOgZtxHx
         GdKG4MOYFkfYmKwyFfZvLUT29t33J10lzpGKDD1ZRfK3GjAJwH9zcl3NLDkzOcCo12zr
         l4pZNWxWu+cZjWPGrqsOf5Zo/lWC1fVVqMYS3sOHmyotZNIF9zBNS1+s9i8Ur2UfFVel
         xQkw==
X-Forwarded-Encrypted: i=1; AKwUvBxu0S+LXLFQWVJHxagR1Zo2loIute2+Xqv90454XHtmpolZW6zopmSWbAF7hQNFWQpEXFmnvQuQksh17OPxT50=@lists.linux.dev
X-Gm-Message-State: AFq9FYKnOSRsPaIPdEpeLplk0An6LJ+xKwx07bfMBZmMlplxCtLfouxJ
	pBRCp1Meuqh6dm2i/L1k3nH5etyGDJ/PuGbEEhyA9eO3fZJCY5frEQ5Y
X-Gm-Gg: AYBFou1Y7+5mDsNvfzJ+JZNDmDPuf+q6PT3pXYaMWSaSSu2DAc+38IUzPwWzp+czRNN
	kiACrwySBHsYgTU8l8ruSLvB6aBBUIMTCzp/2ZYG1PUbQm7yC3NZs38jknvyunj7OUzlm929057
	AOiaBNNEPvgp9TNO/Js8uE1KneY9f0OkPwkC5lDf/ceB15E8DcuDSJdeEDyt7GpBaOnKPPkdD8N
	CaQJ7+zKbJgNhrhUVpku/H0/EPa20ySCun0DcEqoHPv05kuw1a0oLrV8zMU4mPJHOG35nyiptyL
	vKnc0sWcgTeQ5Jh6252rzINupsIGzvVCyjpFzkdaQelOcFv6WuFPSK3SGuRIYpP2NkLWDm1ZoET
	JvQF5OfdW2UQKiSkASuIeTz2e4dvdRgUhseRFfzDd4OSbUCiZNGThNfWh3Q/t0CFl3cjuqN51L+
	OMDjdKd/oh+6buReYYTudSFvfEvIbxkQLIRb6QgA9SEOiXlwPk8krrWhd5L7IO5/Ac/nlzxaxB+
	NDmxAt6KYmGeVCaoxrtXpbbnjUZvvbD3vSmuBxzJ3In7ZnnvzHyO4EdrhJNZ1F6m16kNex5fEN2
	C09KybPQr6GfRtNzCQRg1gxsDn9HAg==
X-Received: by 2002:a05:693c:820e:b0:34b:d8dc:430b with SMTP id 5a478bee46e88-3537e0be0dcmr8619947eec.24.1791694458226;
        Sat, 10 Oct 2026 21:54:18 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca79536sm20678181eec.16.2026.10.10.21.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:54:17 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH] iio: common: cros_ec_sensors: use sensor_scale union member for CALIBSCALE
Date: Sun, 11 Oct 2026 10:24:08 +0530
Message-ID: <20261011045410.356156-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IIO_CHAN_INFO_CALIBSCALE read and write paths send
MOTIONSENSE_CMD_SENSOR_SCALE, but set the flags through the
sensor_offset member of the request union, while the scale values in
the write path are filled through sensor_scale.

This only works because the sensor_offset and sensor_scale structs of
struct ec_params_motion_sense happen to place flags at the same offset.
Use the sensor_scale member that matches the command, so all fields of
the request are set through the same struct.

No functional change.

Assisted-by: LLM
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
Compile-tested only (W=1); I don't have ChromeOS EC hardware. Both
union members place flags at the same offset, so the generated host
command is unchanged.

 drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
index 551b86236abc..2839714f5bc8 100644
--- a/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
+++ b/drivers/iio/common/cros_ec_sensors/cros_ec_sensors.c
@@ -70,7 +70,7 @@ static int cros_ec_sensors_read(struct iio_dev *indio_dev,
 		break;
 	case IIO_CHAN_INFO_CALIBSCALE:
 		st->core.param.cmd = MOTIONSENSE_CMD_SENSOR_SCALE;
-		st->core.param.sensor_offset.flags = 0;
+		st->core.param.sensor_scale.flags = 0;
 
 		ret = cros_ec_motion_send_host_cmd(&st->core, 0);
 		if (ret == -EPROTO || ret == -EOPNOTSUPP) {
@@ -178,8 +178,7 @@ static int cros_ec_sensors_write(struct iio_dev *indio_dev,
 		/* Send to EC for each axis, even if not complete */
 
 		st->core.param.cmd = MOTIONSENSE_CMD_SENSOR_SCALE;
-		st->core.param.sensor_offset.flags =
-			MOTION_SENSE_SET_OFFSET;
+		st->core.param.sensor_scale.flags = MOTION_SENSE_SET_OFFSET;
 		for (i = CROS_EC_SENSOR_X; i < CROS_EC_SENSOR_MAX_AXIS; i++)
 			st->core.param.sensor_scale.scale[i] =
 				st->core.calib[i].scale;
-- 
2.53.0

