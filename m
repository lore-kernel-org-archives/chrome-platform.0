Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED260296BAA
	for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763988407; cv=none; b=D64Zp6F2kn3o+rWnhb76dZSDwOp4nOAUYnZBr+2u7mbp8Gscz3MDK6CR6BtlZ8d8KvIs1nHz8jZlB5ZmdY1eMaQyYNEyp0bszqIzGvuqEPChwTKMrLumcpkqUZBYzKXMnicX+gq2GgtPD8Mjsizqsoq6nOH+O3YxWzteM6lKS5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763988407; c=relaxed/simple;
	bh=sFEJLlSOGpwKWfJJy2xR7D3UVtXX3of8JgCShigAEB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o40KCl4U3VqPayzof13LyRpUJ5AQgz7d8U7pLi3MFOcRVuKkW7bwHamhZtPEvpqd5nfOzVQHr7/RIn/Pmg2TLBnNReDEHfz6RVoJcRBUrCqNdJiiAjolKGw8f/vk7sj1WZdwZOv4BpYMEmbobLbXZ9bAiVXfe0XTA56pVwy3Q2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kRZUk39l; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kRZUk39l"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6419aaced59so5837664a12.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Nov 2025 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763988404; x=1764593204; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uX9BpBCWDOrt5yS3IvVLoplqU11vV2sGXu4lJ+1vr44=;
        b=kRZUk39l/nSmz5N8OwA6WlqJ42NcrJ3+qw8zsGI0hecPzA45CzDCDAObTqUz2RnLcy
         rJAhYIAWPF93+tf/LbG5ZSMTtem+kXrL0FnLrbwy/U7yXJi6403RWOQR9DheS5qUKzwD
         Ts1n9b+kAptwC1yjZnNXsTay6BmAL2pISljmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763988404; x=1764593204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uX9BpBCWDOrt5yS3IvVLoplqU11vV2sGXu4lJ+1vr44=;
        b=sl3ZsD4jJFPUS5k4b6z3d8cmAXINXlnAH/UP2QPgFhnlBZVlYOgEPnQ2gPZ6mu74ZO
         wvA1K8LOrlqtm1YsSK+XqDD7bwtkm/Izjrn+8uj0dcsaIirs2atYDPdUi6QvURPI36/A
         AGcNaBXRlX0JbMCF2lMKePCHeb39FA4LMajFirVaHs0J7pitKN05eWFUAFb7plJMIEmk
         w4cl1Vi16FzcQsIq+2iCFADBVJqMzI7wRF4qUuSnvTIIhTSfYF+HiWS/pF8PeoBo21q1
         BPauqmgRLemeDykjXZzaaBpIicRpKiHdZzhnTD1wEvPEcfYlQQ0p3hQGmbVA7qBiey6y
         1duA==
X-Forwarded-Encrypted: i=1; AJvYcCVfqyh8JOfsvPUFI1GQqfqxjFjJi8JrvcQ41mwrbv6NkwjKbdTCVyJQRRMcwGGo5Lt5EkFUyjbJvBS+3dACEV4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr4z6hrCmVr5Posi95Aj1/0xQZmDBfxlvri2P5DSTeOhlJU0uo
	6EmX9TrVF2kFtvQII6yZS2G0TW/06201DZE7hv1E5sK4D0J24rJjYiZpgYQv8RDUAw==
X-Gm-Gg: ASbGnctwlZca3S3isZOQtfvk50Pmo5f7X5FXEGuvMCAnuLMz98jiqo5NtpTM6sux0M/
	9R50nVNf5h6rQnCluxOfGQML8lghohQ0H2O2P3LfS+rVdq1jvCgK3LDjF4/tRRypI0/2uxylOtM
	o5A1VLgzjwuKMzdEJ9gWd0n7fqO1din+Yi62xlo2ufx1rAzgsEzJayksmmKDAuI1yEqV3Sqn9fn
	PeH4G3Y0qWZU87zL4owJ3WSki26qfJPDteuU8EddcU66Sk0FCCDDeTwtNKwQeyTsrDt2YKqo0dD
	2Ex/vFixrhOX07nyuMYZgKHXQdm45nzYSIyF0QHTZBJ+sD5IwYGd5CLCoZEL8K1EIYga0exEerc
	7OEjLEBNk8ZmjyARdXWDDGkXiDlBFer7hp0ZesDsrqULkOlQc38LjCIBqpLeJvyucpgBPpUWgDB
	D2gy0vWe4JJpD5N7SZrEBqmtVDS9z/8Onmxa/gl/P3s8ig4alou99dJYAjEANWIFYokzevwMGTF
	ixbZbnDc7E=
X-Google-Smtp-Source: AGHT+IFtjJzeAYjXZU1NGg57vdmYBz04gbLDWmTf1/B0FUQwt6XV+ifbJflV2nn+hc4IKrkRaRsb9A==
X-Received: by 2002:a05:6402:2116:b0:640:bd21:242f with SMTP id 4fb4d7f45d1cf-64554442222mr10334834a12.1.1763988404304;
        Mon, 24 Nov 2025 04:46:44 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64536460ea9sm13342599a12.35.2025.11.24.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:46:43 -0800 (PST)
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
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v5 0/4] USB Type-C alternate mode priorities
Date: Mon, 24 Nov 2025 12:46:35 +0000
Message-ID: <20251124124639.1101335-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
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

This series was tested on a Android OS device running kernel 6.18.0-rc6.

Changes in v5:
- Patches 3 and 4 (v4) have been consolidated into a singular patch,
keeping the mode priority implementation within drivers/usb/typec/class.c.

Andrei Kuchynski (4):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: ucsi: Set no_mode_control flag
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 +++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/class.c                   | 99 ++++++++++++++++++++-
 drivers/usb/typec/class.h                   |  1 +
 drivers/usb/typec/ucsi/ucsi.c               |  1 +
 include/linux/usb/typec.h                   |  2 +
 include/linux/usb/typec_altmode.h           |  1 +
 7 files changed, 112 insertions(+), 4 deletions(-)

-- 
2.52.0.rc2.455.g230fcf2819-goog

