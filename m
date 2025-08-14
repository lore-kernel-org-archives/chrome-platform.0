Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B7235044
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 18:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197104; cv=none; b=ZTW1p5jz45Ywe63m1cPJE7F5vFaEFnkXJ7XEzQRN9cOqa49RcWQI+DWN0te1oh5aSyzpz2sCZdXOwGzbgA/GnCy/XTdMNVWZvVtvlWRqZo9uwQeiko46x3R627OzRdKX1+VylsAAHqkYlHIrBtxuJve4B/LNqryVWfJNc1bH00E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197104; c=relaxed/simple;
	bh=9P7e+IQ8LG/P0atlVUdJXVTqMbr9yIy6QOCAwSCjxNM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBU7ZP+WhK42DDM59XeVfeoqza8YpRHgIZdowYM8LlkMLLbrTTdlKvo4DmBnomWtXG9vxMsAvNjSBJgoENCKya+5ugrTLJHtO5r7RxMe//9cpe12ZlWRmKN/YE9cdCvPEUgcwSt8FzeU5ZGhBWNj+m5WHFSmEdUk91xhh/qKGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nLCVv0nZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nLCVv0nZ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-afcb732eee6so232544366b.0
        for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197101; x=1755801901; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qBBuA2TErOLVDapmymnO1MTH+fFI4U6eOj26qi4Hg4=;
        b=nLCVv0nZ1I9fwDxErsNTf6g1u5iaY5KrycFOE224lhpKV8rBu7i9veh9vTrg/uskhC
         HsnKmyhxw7VcxbRyqRU0HQAEbiYqMzctglYsFnXVm4xujYJbYx3s63U7YW8+LCeiPCP/
         wX4s/zCFvwQXpTkelVsOmj/4wFTSCbk8HC83M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197101; x=1755801901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1qBBuA2TErOLVDapmymnO1MTH+fFI4U6eOj26qi4Hg4=;
        b=k4+y1AGUdTBwetMfpAsjlCunDoT31g56Bl46XVptiRntLhPiFbQO5m089fAIWdMTrK
         zb6BxE1eAQX58tteqdtcCdV8ipulCdARwKdfGIuFLACAga9q1yPCX+43lby1aKZhk/m8
         Ez3hOB0u9PPUPjxLFm0FhbA/Irecqj7fDJHBKo1WjgbWdc6Z5ZwrrZyPUupJoYz1IFfA
         vCscfa/W+bwSn+cpL5TjpENyAycrqB6/P8K/27VBEPvyfpgCFqZyIe3widhxuK01KA9Q
         fnixYVlTusL/i/oDaJ8HPaFRl16vGJtbY4OMK2jjAEbXfJbOD/dmmc4LSQh9WkMUqllA
         dTmg==
X-Forwarded-Encrypted: i=1; AJvYcCVmaQZ9FTPFPzB8Qe42GT6j4KmIIg8w/hEP8DeasuZN9csU4v6WceU2SGO1y7pB8DpABlXF6AiXxqEKhnl9ryo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7ZWprthrmFBRrwB+FdBAS5dNhb6yD5MrUO5wJd5c+TekROOZV
	kakqVeJLMOluD5HT/VFBQ3+MFqxul/njhKSqNn1ye7TpbWC1EpKfUnr9QlQ9Hh8F7Q==
X-Gm-Gg: ASbGncsTA/Y56MMZW0S9MppXHCd2fh4DOlQTQjAreAHaWhg5X4YfHlsOEiGArDF1igs
	WqlXGVh/mY2tOVm04KuzqCowH3FYkn/5d2LF7j8Jf+hpHdVMgMb3g57mRFuOTD1DV8732dQM313
	VS8wNV7YWipDxxbfJ75xX1xKCRWNZYrfWB13ljrIXrSkv6X5C+hjlfn1qteAId4HYMJ0xhwwgZT
	P4tYHw4xDc6vcOxiiIbxqyEyD8ozEigFXRPOgCuysGBTrWd7dW0KmG50/i/ClcgBRGgCUO3v9GD
	dgeGohnY7131RZV3jcgHBk7XbJQbCst5LwOkRAaHngRqEAoAorqvGgkQHnJkz73MCJ1kpZHM6la
	Xmc269BwvOYv9TjnQaa0xN5bGdBCxl0NUIYVcafCC4t1OjwsuBe5/VkVi7iSkkwy9YiasAvkOhM
	tCiWCaRnvn19kQDzIf4jF+8ow=
X-Google-Smtp-Source: AGHT+IHefuGAAIAMEMqANOVYlKEH5+LAdTor4fxHNBiEz6a78unbBVFdrI8XeGRL3W3ATolBgKIenA==
X-Received: by 2002:a17:907:1b0e:b0:af9:6f04:8dd0 with SMTP id a640c23a62f3a-afcb992ca27mr396658866b.55.1755197100634;
        Thu, 14 Aug 2025 11:45:00 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:00 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 0/5] USB Type-C alternate mode priorities
Date: Thu, 14 Aug 2025 18:44:50 +0000
Message-ID: <20250814184455.723170-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a mechanism for setting USB Type-C alternate
mode priorities. It allows the user to specify their preferred order for
mode selection, such as USB4, Thunderbolt, or DisplayPort.

A new sysfs attribute named 'priority' is exposed to provide user-space
control over the mode selection process.

This series was tested on a Android OS device running kernel 6.16.

Andrei Kuchynski (5):
  usb: typec: Add alt_mode_override field to port property
  platform/chrome: cros_ec_typec: Set alt_mode_override flag
  usb: typec: ucsi: Set alt_mode_override flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec |  12 ++
 drivers/platform/chrome/cros_ec_typec.c     |   1 +
 drivers/usb/typec/Makefile                  |   2 +-
 drivers/usb/typec/class.c                   |  61 +++++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/mode_selection.c          | 127 ++++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |   8 ++
 drivers/usb/typec/ucsi/ucsi.c               |   2 +
 include/linux/usb/typec.h                   |   1 +
 include/linux/usb/typec_altmode.h           |   9 ++
 10 files changed, 221 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.rc0.215.g125493bb4a-goog

