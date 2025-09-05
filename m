Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9209936CDE2
	for <chrome-platform@lists.linux.dev>; Fri,  5 Sep 2025 14:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757082136; cv=none; b=F6kpU3kEQgdoxGDqaA31EMjsl4cThjp5LqaarrYNWPTmrUWzFIzuznuCzsdDtjdmiJNCC2fCJLuPuFLVDndrHEmWQ38KOH5k/7wDIjTdI6J2svR8cniNhfKTDFcb5SZy9iETQWm9mJ+g7viuz00aRL2W5+bawQ50+o5M0zZ1oxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757082136; c=relaxed/simple;
	bh=dQJtx4Q2JUyqNMwcbEs3oXSjlN1XB+uw8hAQFiczs/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GA3gX5xJNtSfYQ2T95crE6LRYSVFcXGHFD8lcEh/krya0BCqAtxy99UHOh0ykUTJhsLsRleKDyiwwEI0I3+w+jNivv91o6c0jQZqUeS4GMYcwNRl2vh7KWf44JvVGFfg/Br1u7en4KkIlKC1bQcki4oy1UBo8HTSdRkhmdjHJs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lyjv96SM; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lyjv96SM"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b0472bd218bso392795266b.1
        for <chrome-platform@lists.linux.dev>; Fri, 05 Sep 2025 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757082133; x=1757686933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nGF9orEjre2K9KjUIRS6u93YNSWcj3hSYdLRvughM9A=;
        b=lyjv96SMp2S/m6LbFY0gL3FVTiJ5KMKM25rnMFu9cKgHSH2iJrh56yscm6XpNliMZ4
         kRglzWXxqg5IGDa39LvN0KzsPxtjM9qv3j3j4JKVn2rVv4w5jbjLjsv5IMdD30Mr7xRx
         35eOneCn5UMQMfSrSWiqri2wC8k9T3yVK01Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757082133; x=1757686933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGF9orEjre2K9KjUIRS6u93YNSWcj3hSYdLRvughM9A=;
        b=DVvwG82S2KkLXOY2K4khyjK46/z6GDRcgXEbcNwAJ8rib33QrKSGD3cPphblxzbsTf
         1hxqLKQmd5XYcmHvi3/Nmjn+qkOFsVN+NkUjfeO5ZLsY5tEKeeCtQhZmehCokXpwqmm2
         bHGsykJoPSuHCy7cGPOFVReJLS2ozCn4q8EC74HvWypgGQeOleiMzkQ5ixg1KjF1G+06
         +/yws8BtxzkKG4egAbX6Im1+0cXwG31amhshEReU0QRERb+wYm/+L4fz1tEaAKN+rjL9
         ZrmA6p9eJ9SP3+2nMuswwp/d7vD/JMPAmjUCD1hYhbvtpNQWybupE6WwKFb5jodVgLKg
         PyAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFKpMTzhRwVtrBeiZTqEWH1W+ZViSzKQUy8vE6KFMN3DKh9nNpw8G3CnhuwqLOuv9GKQmdWTDb8ma+Cy5SZ1M=@lists.linux.dev
X-Gm-Message-State: AOJu0YySrlhoATK//rsrC5KbE+cUd2HcK5waH/XkDWhB94Z4BQod4KVm
	EAfUxlKF35XhDCyS/J9UdVchS1kugJjK7ay6LZvRE+W+a9HZ05pXdYi86QTTRYeq8g==
X-Gm-Gg: ASbGncsH5kEvBXkjbkf3x56ctVMVZWDSb9hzb1JZjtZlucpF5lgnYQ1xhi2Nwpe0GFX
	QhHOvXjtHwuxOJAwkTuB2bEzW0spM+HfqsSo50slsUY2KJoTdQSFAKQt1ZAHrymtmAaQFe82Ofd
	UGyhCw9KMmKPGIT7XvjlM3xJOU994Sx+q69i9llvFmsJwA2wSWePYaLNvv3uF9PkmDiz+7W2lqb
	Zz1gvJmmszgMlpzqWECmwoMJ9jjF6jURSDcuYeP73sJXuCg7hQxvccO6GO/O5yd/aXQOOxQXC77
	hMh4f/KeHG6/KyhBfNESne4UR+B7WMvlW/PDaQCyoto0aZg97JPuXL6K0Itwdq0BcCa4u0trWJS
	mIZxmAuU3B7Ujt1EEEs45B5u1eez59IMxdshToXG52M44vcDL2PGz8JUpp3Sc7N+OOMNebkGHIn
	D/NZq7+Ec8GsvZYrY=
X-Google-Smtp-Source: AGHT+IFl2mgGV4P7dgOmJwsBFf/zdptfBe4eibQa6wFZqzQSCjDkYJsW2x4P8b1GwYro1fca0TgUXA==
X-Received: by 2002:a17:907:3f21:b0:b04:76b5:739f with SMTP id a640c23a62f3a-b0476b57484mr827180166b.23.1757082131682;
        Fri, 05 Sep 2025 07:22:11 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0476e0d61esm502141066b.53.2025.09.05.07.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 07:22:11 -0700 (PDT)
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
Subject: [PATCH v3 0/5] USB Type-C alternate mode priorities
Date: Fri,  5 Sep 2025 14:22:01 +0000
Message-ID: <20250905142206.4105351-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.355.g5224444f11-goog
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

Changes in v3:
- minor changes related to code style and documentation

Andrei Kuchynski (5):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: ucsi: Set no_mode_control flag
  usb: typec: Implement alternate mode priority handling
  usb: typec: Expose alternate mode priority via sysfs

 Documentation/ABI/testing/sysfs-class-typec | 11 ++++++
 drivers/platform/chrome/cros_ec_typec.c     |  1 +
 drivers/usb/typec/Makefile                  |  2 +-
 drivers/usb/typec/class.c                   | 41 +++++++++++++++++++--
 drivers/usb/typec/class.h                   |  2 +
 drivers/usb/typec/mode_selection.c          | 38 +++++++++++++++++++
 drivers/usb/typec/mode_selection.h          |  6 +++
 drivers/usb/typec/ucsi/ucsi.c               |  1 +
 include/linux/usb/typec.h                   |  2 +
 include/linux/usb/typec_altmode.h           |  1 +
 10 files changed, 100 insertions(+), 5 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/mode_selection.h

-- 
2.51.0.355.g5224444f11-goog

