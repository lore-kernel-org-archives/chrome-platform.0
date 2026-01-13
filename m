Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA6438FEE7
	for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 13:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309545; cv=none; b=Grm+/gPFalVgbF1dN64n7w0uz7YV8ypST0dAazLH+eawqLFbi9AfB3n/s6MPw9AWtOZCaQH/G+moE/+R5KgBRNpMk2XOa5qJq0i6ADdkqIYy3hs1WMf3weEbWx+Cx97kC+2XuJV0vRKjukne2fJx0fhYMS4vsqpDbyd9iWmsLXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309545; c=relaxed/simple;
	bh=fwUzfC2xTG6i2MQ2ip8x5FilPTF7hu2g+bnWM4R+rkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=InIe5793VPFF47Ut0JfcS01UA4L5EKGFkuYJba1ofMrj+1/7/5cRqGFqqcv6I8Keet7AV2LmOrxcDGEAlqR7t8eDXlfidNZHmSDQY/5lIaCUrmDi1yyk+a83Gb7FEqjR69j0JtpiQg/xlVI0E3B44L/Yt1wdVZSiRp9w3dJTNNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eUV9wLxW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eUV9wLxW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-65378ba2ff7so287095a12.2
        for <chrome-platform@lists.linux.dev>; Tue, 13 Jan 2026 05:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309542; x=1768914342; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dlFZOR9bPvQSMDUQEj/b/JXXSikTf4KnUZzPY79O4dk=;
        b=eUV9wLxWLfTu6dneg5LGsiBBQ9UVXYRrD3+pg7NOBvg5ecK85p4DUzAipF313T03ji
         6/vRWPbEtc4pBxsVEyBGmcP9fTcXWLrB96NK62h0Z3m8laid1Ku7AK9dswkWqRe+qsSG
         7nrx+rRDYkMGotCoxpxU3IT9iDFAjEbL+x+As=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309542; x=1768914342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlFZOR9bPvQSMDUQEj/b/JXXSikTf4KnUZzPY79O4dk=;
        b=uRV34wk+GqoUxVbx66eg95Lwpn05EF+KGDxZ+HFzZQhAqXHoI9GSumkbwcwIFt50g9
         tvoYd0ta5CyUubLTefGL9YDHAVuOCvgBo8CLQKEStvTCf3dnr+m3dCIc5oICtoyXFj5h
         IXUaENe0mkPcF8DQ+G3kJOymRSu1Fn446/sXBrNC5k7HT8WEC9zUKeEJAuG2n/skHiX/
         AyZm+DTECg1ausVJ09M/Xl04liY+Il6gddwdM7JcFBLcxBVMADyu1uZ9hD7UMFaixCeN
         eqqpyuu6PUTgc5JbTrtcNJySGjzem8RQAKbZc7FaacoYx15NWmlUDDfVCMpF6Kv22PSA
         g0mg==
X-Forwarded-Encrypted: i=1; AJvYcCWZVIDnwvIxp9ZL+QYGpb+OWGytF6MOJqtyJii18mcCS1bGXHVKUGyJnDMbHva52rs4Qh3sOUzxEBqf/wUULtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3MH0TYlJrbCG/8iuIINgVA9k8EPIT/8/pSoM6x4QMQxT4bvLL
	GEU4cPSKtpikqo9eAk9SX3pfU+MuDgMDl/GERiIQJxiY3Mpc0EjrQhsibnt3kYIp5Q==
X-Gm-Gg: AY/fxX5Sv/eHYrHdYfIVCw3ENNX6XUtjiuCUfjZzJc1h6+BNnE+ScODxKC4p5am9SLc
	RrGsiTj4rfZ3AeoegYpdTOpuEOc0MYQVcd/OcQGuftjNURjGvFc6Swkcyf0n6ZxUKM4fbB+zjMV
	J+ECgpAT8CyKiKkOJi29pU2CDom3cAiZrrI/06Cq9X9WNZ98P9GUKg+ASxyqUknHeklnKbwpkBf
	/bFlYAFbjMBxPtIMfkOKQnjCroi3UnmYZiDzdf+JbijjONrmCoQuD0ErJCmk/NDBm/z08Tuhsqm
	I7RV0lsEFCUMCJR52e1a5U8sUrkzt336Vvan9A928TUfpZVkPK0gY6RUPrmaLvtdTXbxhgcKDFJ
	IdTIEmufmsvYqZpHRlUVv6IpKfKq69jscn+gwduspBtA1E/cpFHf1HzPv/gfsKXYHNkmclMSNs+
	qTeqEDb6CfHrxS2jr+xHcRsR0Yp9fJp/dEUEDeBU8YFhr3RyqE5YoXy12WfABUBLfgmtK9nGuO/
	nG5jz9U
X-Google-Smtp-Source: AGHT+IGRI9YhixtELVuz80DZdKhv617FozvgQfzvl6i67vy1UXB7yEw95GJgE2A7sinO3f5EEbChAQ==
X-Received: by 2002:a17:907:9727:b0:b87:6ce:1267 with SMTP id a640c23a62f3a-b8706ce1943mr751779966b.64.1768309541641;
        Tue, 13 Jan 2026 05:05:41 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:40 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 0/8] USB Type-C mode selection
Date: Tue, 13 Jan 2026 13:05:28 +0000
Message-ID: <20260113130536.3068311-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces functionality to the USB Type-C Alternate Mode
negotiation process by implementing a priority-based selection mechanism.

Currently, DisplayPort and Thunderbolt drivers initiate a mode entry
separately within their respective probe functions. The Power Delivery
Controller (PDC) retains the ability to activate either USB4 mode or
Alternate Modes based on its internal policy.
The mode selection mechanism disables Alternate Modes to be entered by
their respective drivers and the PDC. Instead, a priority-ordered approach
is used to activate the most desirable mode.

A new `priority` field is added to the `typec_altmode` structure to store
a numerical priority value, with all priorities being unique.
If the port driver supports the mode selection feature, it must set the
`mode_selection` boolean field within the `typec_altmode` structure. This
indicates to the alternate mode drivers that they are not to activate the
altmode separately.

The mode selection process is managed by three API functions:
- `typec_mode_selection_start`
- `typec_altmode_state_update`
- `typec_mode_selection_delete`

When a partner device is connected, the `typec_mode_selection_start`
function executes the following steps:
- It compiles a priority-ordered list of Alternate Modes that are mutually
supported by both the port and the partner.
- A dedicated mode selection task is subsequently initiated on the Work
Queue.
- This task attempts to activate a mode by starting with the
highest-priority altmode on the list. Alternate modes are identified with
their SVIDs. Activation/Deactivation performed via `activate` typec_altmode
operation. The process stops as soon as a mode is successfully entered.
Otherwise, after a timeout or if an error occurs, the next alternative mode
will be activated.

The `typec_altmode_state_update` function is invoked by the port driver to
communicate the current mode of the Type-C connector.

The `typec_mode_selection_delete` function is responsible for stopping the
currently running mode selection process and releasing all associated
system resources.

Mode selection is initiated only once during partner registration, and only
if the port driver provides support for this feature. Subsequent
mode-switching activities can be managed via existing sysfs entries. Any
modifications to altmode priorities are relevant only to future
connections.

This series is based on the RFC discussed here -
https://lore.kernel.org/all/20251201122604.1268071-1-akuchynski@chromium.org/
It incorporates the 'v5 USB Type-C alternate mode priorities' patches,
reflecting the change of the is_typec_altmode macro to
is_typec_port_altmode -
https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/

This series was tested on an Android OS device with kernel 6.19.0-rc4,
PDC: TI TPS6699, Realtek RTS5453.

Andrei Kuchynski (8):
  usb: typec: Add mode_control field to port property
  platform/chrome: cros_ec_typec: Set no_mode_control flag
  usb: typec: ucsi: Set no_mode_control flag
  usb: typec: Expose alternate mode priority via sysfs
  usb: typec: Implement mode selection
  usb: typec: Introduce mode_selection bit
  usb: typec: ucsi: Support mode selection to activate altmodes
  usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi

 Documentation/ABI/testing/sysfs-class-typec |  11 +
 drivers/platform/chrome/cros_ec_typec.c     |   1 +
 drivers/usb/typec/Makefile                  |   2 +-
 drivers/usb/typec/altmodes/displayport.c    |   6 +-
 drivers/usb/typec/altmodes/thunderbolt.c    |   2 +-
 drivers/usb/typec/class.c                   | 100 ++++++-
 drivers/usb/typec/class.h                   |   3 +
 drivers/usb/typec/mode_selection.c          | 288 ++++++++++++++++++++
 drivers/usb/typec/ucsi/cros_ec_ucsi.c       |  21 ++
 drivers/usb/typec/ucsi/ucsi.c               |  12 +
 drivers/usb/typec/ucsi/ucsi.h               |   4 +
 include/linux/usb/typec.h                   |   3 +
 include/linux/usb/typec_altmode.h           |  42 +++
 13 files changed, 487 insertions(+), 8 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c

-- 
2.52.0.457.g6b5491de43-goog

