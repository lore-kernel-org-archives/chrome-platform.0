Received: from impout007.msg.chrl.nc.charter.net (impout007aa.msg.chrl.nc.charter.net [47.43.20.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF523373B
	for <chrome-platform@lists.linux.dev>; Thu, 29 May 2025 20:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.43.20.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550589; cv=none; b=jQ41k0gNWS19W37+s5lypCTnDqYaVRK1l7zPICB0DQZWadq/1oTSmlEzc1q0pE9MLO7IZ50WxCsDimVTkTFOW8rotfX2e2IKtfi5HvOOaU16TX4yRgOybALsDBqQhlf0DtK4HKPFrsXGhW06hKaX2K4Sa5D4KnEpYGpNc45Ed2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550589; c=relaxed/simple;
	bh=a6wPm6xw5NSUxgA7Uo+OBaMdvs/rWu4nSlCqzgQMCGg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=rIvgEX8wqR47m39JvODItGDSC5U6kgU5015NmnKvSLNtCQ6osN0UjLMXZcC5BgX/9cVKUmiB1w3bj77uHPmkuEkdSZ7UVOBpvKZNA0dQEKlfB1i8xWR6r8b0rIppBTTe+PcYkyrIH3w2gjf8nneJ6qmtg+HAv6vQ/4hII/9+FiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=charter.net; spf=pass smtp.mailfrom=charter.net; dkim=pass (2048-bit key) header.d=charter.net header.i=@charter.net header.b=XoEGwUme; arc=none smtp.client-ip=47.43.20.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=charter.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=charter.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=charter.net header.i=@charter.net header.b="XoEGwUme"
Received: from mail-ej1-f53.google.com ([209.85.218.53])
	by cmsmtp with ESMTPA
	id KjrDuS76HT6vgKjrDu6aaz; Thu, 29 May 2025 20:28:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=charter.net;
	s=c20240129; t=1748550489;
	bh=a6wPm6xw5NSUxgA7Uo+OBaMdvs/rWu4nSlCqzgQMCGg=;
	h=From:Date:Subject:To:Cc;
	b=XoEGwUmetcUcdN1ATwm0C3aWFapznNa1WaWdbRJMyFkg499/WJt9kGVl4wy1TTOET
	 3RHtkXZ4k++ZrYB2yuG4cfJRRpSnXEubVimQEMBxlTvNBEr8PpvukXFh9knjC86PWJ
	 BVL5LPgv/bsbLUpvlC2Lz7NYh+6f5cLPAsJBj8DOi8V7miMoyhBOfhqw0+NAl5Q8YK
	 SZwV+vOOjK0MPFoAUbEQe5S4ZbDUzgzvsidAyQWBV83NRjaX2BHYGCN/pqvZyQEmti
	 uKGGEB2wFc3DrqXIm4eI40kfnUqhyxgOgew4uPLw+z352ptpMP2gUHpuerYxiZC1P6
	 K2CxdgJ5z72Zg==
Authentication-Results: charter.net; auth=pass (PLAIN)
 smtp.auth=mbe1@charter.net
X-Authority-Analysis: v=2.4 cv=b9u04MGx c=1 sm=1 tr=0 ts=6838c359
 a=xh+fAHEUOhwjonyMPiijzg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=7fxDRey0HOINWTMRK4kA:9 a=QEXdDO2ut3YA:10
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acae7e7587dso195219466b.2
        for <chrome-platform@lists.linux.dev>; Thu, 29 May 2025 13:28:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YyD2C2TFmb52pYzZrU/sqRixmkqT8NOPzW1LZsLna9cNiFOUpUM
	Om3thUdl0kTRoCPLF9B5GPp/tZQGKBwQ9bUMTZD9POtvGbAxIUg+OSWxCBjnU7i4N9n7Gjz1QrW
	Hql2OYznThGlzerha13zWOi20LlAqjX4=
X-Google-Smtp-Source: AGHT+IFYtsAfwBWNhAd04YQ4ysXD76OMLOOZuXZVwjSQ60Ob30wndzYQ48A/syG1+KXcHvt6xVWne24MArfMGUujDJA=
X-Received: by 2002:a17:907:3f99:b0:adb:1b2b:fe29 with SMTP id
 a640c23a62f3a-adb32266110mr72088166b.22.1748550486962; Thu, 29 May 2025
 13:28:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: michael evans <mbe1@charter.net>
Date: Thu, 29 May 2025 16:27:55 -0400
X-Gmail-Original-Message-ID: <CAF9oZ=6BVqCnUWH1ptUCZs4sQ2AX9Hb3aTjrS+pNrTRxUzDq6A@mail.gmail.com>
X-Gm-Features: AX0GCFtNHqUCo9ynkwF-87kmAxucqR8MC_AiPUgzl5GMuQigVoiHiZTqmzpeWO4
Message-ID: <CAF9oZ=6BVqCnUWH1ptUCZs4sQ2AX9Hb3aTjrS+pNrTRxUzDq6A@mail.gmail.com>
Subject: Issue with cros_ec_sensors.c handling of sampling_frequency
To: groeck@chromium.org
Cc: chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CMAE-Envelope: MS4xfJ8oDQs+kbvyensJIHnD+5zcq/PBOZkWb0Me+5bTu8mtPl9k0Zx53NTmNdX5Oi7huOdCiejOvCu0ciNa9wM0+c0MN7eylOmmvIF42H315ANmbdREl3E2
 Zt57Bt/ZZYdRxv8qUl9KXbHe7qj4RBIb6ArlM6BjEDg3pA82fz3KcmZCOC6WFRTsFHNT6ZZ/TwXZkbHGRCjyrLH8KY2/+v/a6as=

Hi,

Not sure how to report this but figured I'd start here. Please let me
know how to report this if this is not sufficient.

When using the iio device (cros_ec_sensors) for an accelerometer
(bmi160) on a volteer/eldrid chromebook I find the sensor does not
report any samples until sampling_frequency even though the value read
for the sampling_frequency shows a value of 12.500000. I spent some
time looking thru the drivers and the EC code from chromium and think
I see the problem, described below. (I sent this to the developers of
iio-sensor-proxy as that is where I discovered the issue)

In ec/motion_sense.c motion_sense_set_data_rate() is called when the
host sets the odr (sampling_frequency) or when the power state
changes, power up, return from sleep, etc. This causes the device odr
to be set to a valid device value (on power up) rounded up, in this
case it gets set to 12500 even though the host has not yet set it.
This starts the device data acquisition and you can see it is running
using ectool motionsense fifo_info et al. However, no samples are
output. I believe this is because the above function checks the host
sampling rate, i.e. 0 and sets oversampling_ratio to 0. This causes
fifo_stage_unit() in motion_sense_fifo.c to drop it. Once the host
sets the sampling_frequency oversampling_ratio will be set to a non
zero value and samples will flow to the kfifo in cros_ec_sensor and to
the char device, (motion_sense_set_data_rate is called from
motion_sense_process when the host writes sampling_frequency).

The issue seems to be that the sampling_frequency in
/sys/buf/iio/iio:devicex is the hardware sampling rate, NOT the host
configured sampling rate. There does not appear to be a way to see the
host configured sampling rate but it does get set as side effect on
writing sampling_frequency, at which point oversampling_ratio is non
zero and away we go.

This is done in EC code, not the kernel driver. The kernel driver just
passes requests off to EC via MOTIONSENSE_CMD_SENSOR_ODR requests. It
is possible to add a write to the odr in cros_ec_sensors_core_init
(cros_ec_sensors_core.c) to get the device and host configured odr
rates in agreement and this may be the solution.

The diff of cros_ec_sensors_core.c is:

357,362c357
<
<                 int odr_hi = 0, odr_lo = 0;
<                 if ((cros_ec_sensors_core_read(state, NULL, &odr_hi,
&odr_lo, IIO_CHAN_INFO_SAMP_FREQ)
<                      >= 0) && ((odr_hi != 0) || (odr_lo != 0)))
<                   cros_ec_sensors_core_write(state, NULL, odr_hi,
odr_lo, IIO_CHAN_INFO_SAMP_FREQ);
<         }
---
> }
