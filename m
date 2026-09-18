Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B83D357739
	for <chrome-platform@lists.linux.dev>; Fri, 18 Sep 2026 13:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736523; cv=none; b=l9ZTVag+nbQ8j3f2qqjyHEdZCParKlDcqELy/oH4thidz8CUP/DGU6SUTZZlyQIh3wuOTyl5PHqmYb4oUdUULcka9to3J344rvdYhQGUhVhsxQKRJpyh0fkTIDskB/Vo6NQztDRGivePMAHpxriuf2bGO+c540TbBjrv88HEHq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736523; c=relaxed/simple;
	bh=JzY7qCjsMGCCDrnykYP+j+8saSrI+L+fwV77wWEiOrQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m71CGunDgMsw/2dLch7Eg0jn/iC9CwfMGxKnFtuQOhaQ1yWUVRPLuzokVvlant7BUZ80wkXEd3Nb0d8TkVJPMW3ebs4lvhEINBRoVfeTZwBuNRWDHYRZHFTJn7iAQ++fAfJqidGxRoUchozkp02HXxGlEnxu0uXbKTTVHgmiAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=tnS4G0FW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="tnS4G0FW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so3963085e9.1
        for <chrome-platform@lists.linux.dev>; Fri, 18 Sep 2026 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789736518; x=1790341318; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGji7N6SbnVIadV5bhhuwD8KcQaMiAzmz+Si29Ez/Z4=;
        b=tnS4G0FWZbION7046abzWa7Kke7bsRMDU2rBnsd+Thlwpx5pLog5w4hC7/mBexw99Y
         wGUiPz4R0FXOp2lzK3T2qQFleOgIr8toK7PCMceNhHV5OWsGtUbPcVovxZlMEQ4e17Z3
         sdFEixcM8PvYqBoVtxhw08Ta8q1rBFCjDimCsJ9mgdoQrWAoglLr9OWNbOGbWyIm8AtP
         ICNO7+rSERtl4oMrXTtzLlP0VVcctKYPjgDm/wuE4u1ba49Xi4VsIUFPQvnV4mbZo0bQ
         t34vkiXw6GSHPJP8NtNXSX64aqJ+NlU7qR7P2t2XAAiL42gjBTui8uz2QPu/Gs0n/yd6
         /J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736518; x=1790341318;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MGji7N6SbnVIadV5bhhuwD8KcQaMiAzmz+Si29Ez/Z4=;
        b=GWt22sG304vfFz5RjY3eQFVksNl5Rxw9kQngWHcGSvi6iv1PbLnaRsmzDpIHhFb1a9
         sBG+wzGZT2qZp95YIf/Wuuu1iBkNTjK1BX+uy+HR8XvAV/ga6+ZTKm9G6UO0jM4iH0By
         7Tr2GLhkC/UbKMk+W1PSq33z6sGzRKdkVHCqoOQBdQj+/P6r6cKCv7ElLSaO384bQtrg
         nBqaAIBOjzf+rGDFzz9S1XfaM0WZTtbtrY8itBKQ0PAa+dcldLKg66QeWie9owbcK4KQ
         NY6lxYf+QlqDVUu5NSgl5RUpClyWm3sGlludKtW9WzkWZcsFmnLVyPSwgineDfdGSLLC
         YpAg==
X-Forwarded-Encrypted: i=1; AKwUvBy00Q6LgpnwAXlfZzDzL7lMrUSyYTLvMrkj2dlPk4Ujmm4pSQovPHP9WPHmmu2eDBeQMvxeodvvn2c95dO+MdA=@lists.linux.dev
X-Gm-Message-State: AFuF++kIN+sdXRPzX+FEWkEwBTyBdVQSy/XQvXEhZ26jSN+JS8QY/Ahc
	zds354fzMCS8GchXN9Qdb1BqiDpDCj+8CmsjQHilF7/l92oXmk27WAMT8yEssKpAdW4=
X-Gm-Gg: AYBFou0QgERXzWMua3k+qyqQJOyj55imJ9TcmTa+IfqR94gS0g3s3vqkfakWPzNSKjc
	ZvVIXg4itYmU2uAnUmISWaZBbSmS0dvTe82tMgw7J9ZkP+/7ndSPg4f0QUw/nq1g//UJWjx4mvw
	JBKG2dz3zV2rnYoF2Vo4mWLgscrXU1D7rno9sIUgnlVfWhcbfnG2+spyQF94mVepR+fjaG9ONPl
	KXk0qOzjz7GBG1bAS5uzUsuDqniwgqL5AL6EgXvWZFtsryZ0t59V1mfYsWk3gSJSNKip38qhpOx
	wmbtwg5T0lAYtCJi2baiH6kIIQX4DnfA/1nGpnfOuwODpOyU+sKOZTpzRvuRKlJy0S+JUTHGMMN
	7mx43kl6BrpWJYh7nabz8ZBOJ6+/Zeb8OFKsQnt/gXREBfguzfBtjTOzujbmmb6gg7phoL1yi95
	zZ9s7kxAeu8cbg5OYJuTgmzrJaE4WQMuyxP83FeJK3nYd0rLEiNoQjULDydjsb506UoaOY+ibKa
	3osteTs0PETX+TyFKJOuTl4SQ==
X-Received: by 2002:a05:600c:8b21:b0:49d:1df8:156d with SMTP id 5b1f17b1804b1-49fc574f001mr30144785e9.18.1789736518421;
        Fri, 18 Sep 2026 06:01:58 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:767:e33f:e8e7:bc85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24034esm188663345e9.15.2026.09.18.06.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:01:57 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: [PATCH 0/2] i2c: use designated initializers for acpi_device_id
Date: Fri, 18 Sep 2026 14:01:49 +0100
Message-Id: <20260918-acpi-i2c-v1-0-caf4bea4886c@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD02rWoC/yXMQQ5AMBCF4avIrDVpSxRXEYsaU8YCaRGJuLti+
 SX/excE8kwB6uQCTwcHXuYIlSaAo50HEtxHg5a6kJUywuLKgjWKXFUlllnvjCGI+erJ8fldNe3
 vsHcT4fbu4b4fJiVLhWwAAAA=
X-Change-ID: 20260917-acpi-i2c-4198c83df77e
To: Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <westeri@kernel.org>, 
 Shyam Sundar S K <shyam-sundar.s-k@amd.com>, 
 Elie Morisse <syniurge@gmail.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Devyn Liu <liudingyuan@h-partners.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, 
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hans Hu <hanshu@zhaoxin.com>, 
 George Cherian <gcherian@marvell.com>
Cc: linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789736516; l=3020;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=JzY7qCjsMGCCDrnykYP+j+8saSrI+L+fwV77wWEiOrQ=;
 b=IDSzYBmue84R08QroUyy3NH/AxpYxihKb9K2xhN1QPp93+Ogye+hBhK4mHIOdf1zDUyhK9Zvj
 Ey74QzEBKIGB05J6xZ7TUIbv5ZKaL/sgYUsp72oIXBPUQ/meroTQnXV
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

This series is converting lists that contain the acpi_device_id struct,
which is defined in the include/linux/device-id/acpi.h to make use of named
initializers (which they do not use currently). This work is part of the on
going effort in the kernel associated with device-ids [1]

The plan is to convert acpi_device_id::driver_data to have an anonymous
union, similarly to what was introduced for PCI and I2C device ID tables.
The goal is to increase type-safety (most of the existing casts are gone),
to improve readability and to make use intent a bit more clear:

```
union {
	kernel_ulong_t driver_data;
	const void *driver_data_ptr;
}
```

But for that to work all lists containing the structs need to use named
initializers first to avoid triggering -Wmissing-braces. I already have
patches that implement this and touching a lot of kernel subsystmes that
use the acpi_device_id struct and that list keeps on growing. Therefore,
I have decided to split the series per every subsystem into:
- pre-clean-ups that convert the lists to use named initializers
  (which is this series)
- actual implementations that make some of the modules use the new
  driver_data_ptr member

That way the task can be fragmented into manageable and independent chunks
of work and makes this effort easier to review.

Tested builds on x86-64 and a64 in Yocto using 7.3-rc3.

[1] https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
Pawel Zalewski (2):
      i2c: i2c-core-acpi: use named initializers for acpi_device_id
      i2c: busses: use named initializers for acpi_device_id

 drivers/i2c/busses/i2c-amd-asf-plat.c       |  2 +-
 drivers/i2c/busses/i2c-amd-mp2-plat.c       |  2 +-
 drivers/i2c/busses/i2c-cros-ec-tunnel.c     |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 42 ++++++++++++++---------------
 drivers/i2c/busses/i2c-gpio.c               |  2 +-
 drivers/i2c/busses/i2c-hisi.c               |  2 +-
 drivers/i2c/busses/i2c-imx.c                |  2 +-
 drivers/i2c/busses/i2c-ls2x.c               |  2 +-
 drivers/i2c/busses/i2c-mlxbf.c              |  8 +++---
 drivers/i2c/busses/i2c-qcom-geni.c          |  4 +--
 drivers/i2c/busses/i2c-qup.c                |  2 +-
 drivers/i2c/busses/i2c-scmi.c               |  8 +++---
 drivers/i2c/busses/i2c-synquacer.c          |  4 +--
 drivers/i2c/busses/i2c-tegra.c              |  8 +++---
 drivers/i2c/busses/i2c-usbio.c              | 12 ++++-----
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c     |  2 +-
 drivers/i2c/busses/i2c-xgene-slimpro.c      |  6 ++---
 drivers/i2c/busses/i2c-xlp9xx.c             |  6 ++---
 drivers/i2c/i2c-core-acpi.c                 | 14 +++++-----
 19 files changed, 65 insertions(+), 65 deletions(-)
---
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
change-id: 20260917-acpi-i2c-4198c83df77e

Best regards,
--  
Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

