Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3F6187342
	for <chrome-platform@lists.linux.dev>; Mon, 20 Jan 2025 09:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737364610; cv=none; b=rbnipbs2xv+reB7y6+NfYe9k/7cyJq3i2dlEkVtl1zt4I4toLG91UfH9fEeJbFEZAZdGquAR7D7BgaLuk3B6JtRJ8IGjRz1I0jwL2FrcApznzhCocpq0l0FMkQtQyrfdefEW5XlgccaDyTN2Kp/289AgbNLjxhfTLSY8FozEJvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737364610; c=relaxed/simple;
	bh=ls8SZUINCManUHZndVu8F2E7mshCWh4JB38M2H99A3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o/T6QzbO1cJbtMwmQl35XWAAg0W8UFfL1Sjgl7parOGFdq3bHpxVE2bix0w5gek2U79TudkL5coU3DdnCtB8WTw8ag2Kq9PzFg4oiy7eN+rBCVXDNEbvNA2kdleTmy+sFyh7bhZF8FePOMv7ST7hpPR88tM1sIjPsE4W3IOT47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NNrn0dpi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NNrn0dpi"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401e6efffcso4664032e87.3
        for <chrome-platform@lists.linux.dev>; Mon, 20 Jan 2025 01:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737364606; x=1737969406; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=akYyYtu9ug+s+ErfadY7ZCYyf6Bi1pgbW2VJ6MzYjW4=;
        b=NNrn0dpivzYOHTfyLLCJ9ThpTYrqVvH3BSfjXXnDiL8I1zxu0Xy3Ew9lyTmgbImqLn
         0Vl0qDE8iwhFafFOeM4MufC31VRqvCdZbp46uG1PamrYar4n4wy8DBvJ7Rm24kcYdL8S
         4UKWojHTH0EDM9ZNEY2pOa7YnjklM+QrzPmcKk4KEkXZrjYNU+rOAhGiVlCn7K1Y43Zt
         DFUM0t4+Xn3Tl/wSUo+Z5MIlJAgstKkBGnSxsJejhoVzIyLEJvDeE2HlC/b6seLVwr0V
         61FEn6Vabtc275NMgZ8TDqmg0EMFOcplhKjjh4faj4PByZMj79/4mOJPqfmpz3EaumrG
         +2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364606; x=1737969406;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akYyYtu9ug+s+ErfadY7ZCYyf6Bi1pgbW2VJ6MzYjW4=;
        b=vuQxeU/lxZCVTRiZCtKVcEbei19bOQ1X0Y/Bma0RAUgFq7pnnI8rn0HBp8hmlvBvbF
         yZ+VcWMaaOA+ihnBw5p1b5KSd4VY64TWOxuwYr5Vw62sVgUDHOS+MJCmPifxHLuBVwXy
         CUM0zMlUsMm/w4q9wUovvZch95OZDXX6G8xCF5jT8hdXRCp6bGD1QxM4sPJ6gonr0Zjg
         GAu8Epsye8QMvGV4EioNqxbgRMxPhN78Tzk4SK1LiI7LQYk4+D0eZImpQIWbw6F6yAmR
         NxbKEOq+kjp7t1obnHpSKDKR6dKD0ImkNuTXVjxPeCL4pw0ZZs/4WLuJ2OcXZxRzssmC
         ToIg==
X-Forwarded-Encrypted: i=1; AJvYcCXXZ/zYxiJN9V5Gy5LShkE4/9YQOY8oq9PkxbCTeDkmP97WXFzem1YlaDfjmau85+aK8+QvLiXJ98tbVYK0b5M=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIMCZu0e0CtaOxoWFQ/zxVi0bW+xPlreXxFLIIfY6JGYSB+RX8
	bL/HkxNtMIDpkvS0YcX6PYT2TkFaR3BNoBTnsUZVQ1IWI8JWYWw60yofx+jKnZY=
X-Gm-Gg: ASbGncvGIhR9k4mIOV+pdOTIKrtCsMKwFo4JxCnWa0M5J/cx99gFbhRkRX7AdGWThpe
	PFtKoMwSjkDJrOsDV0BvBkF00Y6+HWa+3E1uihHiJ/lAryYnd8+qL8UWTZMjTHSE81a7Q3/BJbE
	/XOJ1lsV2SQoZqzzaAxageYlLI2eE7jQ2inDcrgNKCmhqw0S7y5aDLNA8dhp5F8XZ1j9egMmdoC
	tuDhpsrnVjhsHAoCkQzRRxIY+VOKIvb+mQlN06sCkifsH9LIF/zqQpNGxCOpl2lZnxXl4HVkPuf
	DQ==
X-Google-Smtp-Source: AGHT+IEIPac2D7jw7UzzKanZZDy5eKrPYwIrYNbWK/3d+EJb5mgyyAguCCFRO5zeoxDyhnvP0G2Flw==
X-Received: by 2002:ac2:4570:0:b0:540:2542:d89a with SMTP id 2adb3069b0e04-5439c288152mr3515416e87.52.1737364605702;
        Mon, 20 Jan 2025 01:16:45 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af729ccsm1223639e87.188.2025.01.20.01.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 01:16:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/3] usb: typec: ucsi: continue rework of command
 interface
Date: Mon, 20 Jan 2025 11:16:42 +0200
Message-Id: <20250120-ucsi-merge-commands-v2-0-462a1ec22ecc@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHoUjmcC/22NwQrCMBBEf6Xs2UgSbaSe/A/poaSbdsEmstGgl
 Py7a8GbxzfDvFkhIxNmODcrMBbKlKKA3TXg5yFOqGgUBqttq41x6ukzqQVZGp+WZYhjVsEGF1r
 fHY7OgSzvjIFem/XaC8+UH4nf20kx3/TnO/31FaO0Qqu96cQ5tt3lRnHgtE88QV9r/QCZH90ot
 wAAAA==
X-Change-ID: 20250116-ucsi-merge-commands-f2f6f5c93466
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 =?utf-8?q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1780;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ls8SZUINCManUHZndVu8F2E7mshCWh4JB38M2H99A3M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnjhR7px+MnOLytv76/PU8Ok5cns2W3dcXvmzdV
 EXE9P27+ceJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ44UewAKCRCLPIo+Aiko
 1TN5CACTJGqEdbl9jzTjuuT6nQW9Y++fRQRzkKsSFCra9Tlk7iezm790SYqFGW0xFYyslpy6Rxb
 0E6OVkoCTdVvuSeDxfuR4LmeLACB/+D0p00Q4Y1gVIm1twFYem3+3FIsIdQXJh5P8zsi/cCLfpm
 XNb6E+g/Ym6BlJND/216VllabgzpquP1MkIDvTtEIdnwHI4XxM7NlvThsmzJezggivVGNXZSNuA
 A15GSh++JoRjKpm2BwBunFrF+Jp6v3kYFJf6inQ9f7xHO6pIi6zjSOKUi5XHi4cMhVzd/gCbbPJ
 FgUmNJKezoiS8CeRwY46wvITuPT9IEoGgo3S+9dKyKPN3RG3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

There are cases when UCSI drivers either want to mangle UCSI commands or
its response or to completely emulate some of the commands in software.
Currently code to handle such situations is split between sync_control(),
read_cci() and read_message_in() callbacks.

Make sync_control() also return CCI and MESSAGE_IN data, simplifying
this kind of handling. This series reworks CCG driver and LG Gram
quirks. If the approach is considered to be acceptable, it will be used
to emulate AltMode support in the GLINK and Yoga C630 drivers: on these
platforms DisplayPort AltMode is handled via the non-UCSI messages,
however in the past reviewers suggested reusing UCSI displayport driver
and just emulate necessary commands (mostly GET_CURRENT_CAM).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed build error in CrOS UCSI driver.
- Link to v1: https://lore.kernel.org/r/20250117-ucsi-merge-commands-v1-0-e20c19934d59@linaro.org

---
Dmitry Baryshkov (3):
      usb: typec: ucsi: return CCI and message from sync_control callback
      usb: typec: ucsi: ccg: move command quirks to ucsi_ccg_sync_control()
      usb: typec: ucsi: acpi: move LG Gram quirk to ucsi_gram_sync_control()

 drivers/usb/typec/ucsi/cros_ec_ucsi.c |  5 +--
 drivers/usb/typec/ucsi/ucsi.c         | 19 +++++-----
 drivers/usb/typec/ucsi/ucsi.h         |  6 ++--
 drivers/usb/typec/ucsi/ucsi_acpi.c    | 29 +++++----------
 drivers/usb/typec/ucsi/ucsi_ccg.c     | 67 +++++++++++++++++------------------
 5 files changed, 59 insertions(+), 67 deletions(-)
---
base-commit: 0907e7fb35756464aa34c35d6abb02998418164b
change-id: 20250116-ucsi-merge-commands-f2f6f5c93466

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

