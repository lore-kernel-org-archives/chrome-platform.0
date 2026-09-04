Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D50F4A6CF7
	for <chrome-platform@lists.linux.dev>; Fri,  4 Sep 2026 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788535447; cv=none; b=FmyRgPtb/2DHsj7B23R5oyHWfsU2+yELLdJ5wD7uWBoAgBnZnVDFpmxYGIvodZyfmuJ6mikmapc7JJ55gS1b3e2++AWfOr7hcDNbDItzvlkoOBHb3OQOIseYB0GBFeNiT/8Qu5SNWl5eyxqo/ADotVbENPB/SGcOKmPhKwzVY5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788535447; c=relaxed/simple;
	bh=3dZpk3ql/VOUcsd/ip7svqEsusEqDY6uWmgL27Pxopg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pHyib9b0mZ+Ykz8wL+5lk7rTH3fwa9oAIxDqLcCmBxUG7ynCB7cZ2IJCfuEegskcuYdPor66yvDz5YdSurXWIkZqwY8LhGTOcOdu+NoXRKPZhbaw6zFzI0sDA15JaK1ys4Y7wn2aOC8zDwXEM5IJlTBJ9j2nWznoFAoIt3k3piE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=B6Evbjjj; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="B6Evbjjj"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso9218775e9.0
        for <chrome-platform@lists.linux.dev>; Fri, 04 Sep 2026 08:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788535444; x=1789140244; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G8jKhCG2cQQizumBfeZP6zYIa3G30UFI5xNJCludORg=;
        b=B6EvbjjjDHlsOFgdsdoBqDA2V5/IKvgVzm2j5n9R6vko3xkDOGLBtnNgu/dBYgVVkt
         HrCtXywoUh0V1vkFs1rYsnrLuDWXPMyHeAv0aRPSxqpIbeTX3bwNQr9qFnCqnE+Vszac
         zrTe/GlfWVOy2F69A0BOy0PQ8P8jpBlJDgS0W6Nlw3CAm3nt9+klo3UqgdYOUM3h5bRa
         QLm5vhxwUYJXlGJf2LrbcLExK6i75vaK9toV6CLnVmcGw4P7inUQvOxGCu1IuH/fxpS2
         kV5wQ9mqZZa/mZX9syp7WFGcf9J6LHGOhFECVlNrgMvLeR1Fa+rfb0H2naufyDlNlP8P
         9X+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788535444; x=1789140244;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G8jKhCG2cQQizumBfeZP6zYIa3G30UFI5xNJCludORg=;
        b=HlmGeq+GUJbj3qeoeoQBDDHBrS7QLZ9ypR3yvJ1PaJvcgvQOvWxeSMMv3lBDUv5n7g
         4PL9109LE/U/NzBSnkUHfPQkWOtn3rPTG+KRmPhVDfwKeqxsEY59o+xAC1G7iqcVEvvK
         iGur/PSt+gEvPUS3ZJ2lxIzX6Ka1oNWVOo/fKGLWFiZvjwwO20B5Cser43e90HCeObjP
         QL2ZP0wBbX83Y77neZR20o9XtsfiO561gFUyqaqo7KEPj7i8O2u8aSc05Gzen5QD2OXP
         +Y4SaIfFv48k0KDsGIlgT95th/+0CkDqukW8K9F6veQjDQwOqMRPdwC2lb+wIxTAjJrQ
         ysbw==
X-Gm-Message-State: AFuF++k5fLVA9Qo8BQoefUb5hsVb2vEAyoB4bDOPDKxFDT1C+lCcWpiw
	f6Zo0dDa4NoLB7rLtqdYGr0/FsJcvdwrp4s8YWHHOxYSU0Fu2jrMk/2CUWXCGoGQpYU=
X-Gm-Gg: AYBFou0KjgpUvRiNUmLXMZ88Yi64PWHuGOGXCfFpJRR70Ly3E4rgB7X/9JIkE/fRbES
	CNGxFVguR5yyRknfM7xEprbN1pHHnB1lGmMeozzLBjkVGgk/+Kx3BCr7DY5yhB/a8v6CMqfWH4v
	ksgoiOeD4BQSGTl1gCN3nIpus3UQ8mLmJwfUJpEEcXdhpmEB0cI6rVRDsX37SevFPg3ewRQBRkx
	GAXolIrEm3J2JEnE3I+TEB1H0nE/u74YxKAfTKfexPSFOzCDqxfE8cd+XWvz4nlKV+xnwmawcxa
	Lvy0BsLSGiQYV0aTmTWfKuGTLl9XhI8U7yqZtfudm+tuTaSA7jyhSpnoNOM/zB2PaIzDlHogjdZ
	lROuY/L7+nFbJZvGVkncHELC0qQ2b8lhMma8kP/uh/qTkn10NBrSLi5TcW9E/c34+cpQBYIeGZw
	HuqGUqPIfrymsdtC9YbBzSQxFUZV4zene7BC+UrKMyQspDpesWEhh9duU84ITHE6pE9Brr9tdQv
	0I1dMzLeSB2o6DY
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr74559575e9.2.1788535444047;
        Fri, 04 Sep 2026 08:24:04 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:2568:24c4:f44a:8310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm74890805e9.12.2026.09.04.08.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:24:03 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 04 Sep 2026 16:24:00 +0100
Subject: [PATCH] firmware: google: use named initializers for
 acpi_device_id
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-acpi-firmware-v1-1-7e4d7a09198e@thegoodpenguin.co.uk>
X-B4-Tracking: v=1; b=H4sIAI/immoC/yXMyw5AMBBA0V+RWWtSguBXxGLUlJF4ZOqViH9XL
 M/i3gscCZODMrhAaGfH8+QRhQGYHqeOFLfeEOs404VOFJqFlWUZDxRSqSlsG+WIhBp8swhZPr9
 fVf92WzOQWd8J3PcD/9U4hHEAAAA=
X-Change-ID: 20260904-acpi-firmware-5c9fd18aaea0
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788535443; l=2650;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=3dZpk3ql/VOUcsd/ip7svqEsusEqDY6uWmgL27Pxopg=;
 b=tYx/OWBgdFUcq+ZTe5T/sNIp89JKZ7ZAt3rHXtCEoUnmLWeieC6Go9T+oUjdpscHDmg+76l3t
 JuXdYWjlaDwACe2n4wyH5LoGG7dNgsnp6jEZozPFKH05aYvAWmGfAkm
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Use a named initializer for the acpi_device_id fields which
makes the code more readable and consistent with how lists
are initialized in the rest of the kernel code base. Also
drop explicitly setting fields to 0 where it is redundant.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
This series is converting lists that contain the acpi_device_id 
struct, which is defined in the include/linux/device-id/acpi.h 
to make use of named initializers (which they do not use currently).
This work is part of the on going effort in the kernel associated
with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an 
anonymous union, similarly to what was introduced for PCI and I2C
device ID tables.The goal is to increase type-safety (as most of 
the existing casts are gone), to improve readability and to make
use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to 
use named initializers first to avoid triggering -Wmissing-braces.
I already have patches that implement this and touching a lot of
kernel subsystmes that use the acpi_device_id struct and that list
keeps on growing. Therefore, I have decided to split the series per
every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
(which is this series)
- actual implementations that make some of the modules use the
driver_data_ptr union member

That way the task can be fragmented into manageable and independent
chunks of work and makes this effort easier to review.

Tested builds on a64 in Yocto using 7.3-rc1.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
---
 drivers/firmware/google/coreboot_table.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/google/coreboot_table.c b/drivers/firmware/google/coreboot_table.c
index 25ee8cf53429..2c8c928fbb33 100644
--- a/drivers/firmware/google/coreboot_table.c
+++ b/drivers/firmware/google/coreboot_table.c
@@ -250,8 +250,8 @@ static void coreboot_table_remove(struct platform_device *pdev)
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id cros_coreboot_acpi_match[] = {
-	{ "GOOGCB00", 0 },
-	{ "BOOT0000", 0 },
+	{ .id = "GOOGCB00" },
+	{ .id = "BOOT0000" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cros_coreboot_acpi_match);

---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-acpi-firmware-5c9fd18aaea0

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

