Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566C30BB8E
	for <chrome-platform@lists.linux.dev>; Mon,  1 Dec 2025 12:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591976; cv=none; b=MdGutPa+CrmQ3VS552A4MI6yZPz58ce+x0UMHsLx/zjC2Bo7xariH+pA4WMZoTR36DKRSog7xXno/8m7gIs5R0BZTTGYOkOl8Cik4KLNHzP9yXHFhQqlW5EMJEAIxJcuuUOSQJqu9o/Xac3redH6VajeP+MG3uMslFsBbb/cn4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591976; c=relaxed/simple;
	bh=6OIAP4fGmgimdtTJrfs4TMLavclr4sycXrfjFbr+ixw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffn0QxBpxTMGFuQI1PBtfEBcYT9nZaDKM6P1VvYyZDpf4hUitvxmkAz1gDRXBCCwOVYU41r/OpzXAoZHNbhSW48SjFpO7SB6EMnHwEobTiZYlE6ghSOl+NWkeVwFmKbssPtBor9uGTkIP3nj+6LZI93l4ATpxI0KBiohWifmP0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BNyDMUd5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BNyDMUd5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b728a43e410so703972266b.1
        for <chrome-platform@lists.linux.dev>; Mon, 01 Dec 2025 04:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591972; x=1765196772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+3pYB2i1GVS17Vzr4d6LX2uFwVFZUJ8kMPwOvWk9Mw=;
        b=BNyDMUd5u2wNyKLRtk3zzlh92R2mnxqa5O81En4lgOh6ykIAWIolbyp1PqFZpJS/0r
         VUjVySxQbFqWJgcFjvYDi5QDuyaN6DD10Dalh3PMgZVU4fMOOwi2pBAtW5R9zgos/cTg
         jlsG+bci8GvnYveyrn8owNxOIUFkd3CnoTJ00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591972; x=1765196772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+3pYB2i1GVS17Vzr4d6LX2uFwVFZUJ8kMPwOvWk9Mw=;
        b=iuvj3w+cGMBfixBxEmaQFAIEGWcWutbHS7/H2DMC5D7RVSdWJ+88diS7X/R9VGUAT3
         RSCgizjPJDseVX2ieLj4uxHVn+ncNH7Wzkf+XuhBNk4z0LdAKSTMN6nXiqZ0k4K5xW5S
         z942LKjNgVFKMj+Ubxr+iJORDIKYEeuEEHPArmLKAukbPoARzl/XfXmDSq8uW7ja/Rr/
         o3KJbzL603xjuzTB8buO/5WsGAR8LZSknvS9gsqy+yiOsaLbh47/kawifMYESd+vSoEE
         BuAS7R6x7h6ixda2Q9sxWL/6CE6egedkg6oygCIXf7Yx2JN4AOIca5Ffr9Gl/MC6wEXx
         2sdw==
X-Forwarded-Encrypted: i=1; AJvYcCV/ciyr5bUpQMTXPW5WGis3HCQDfV4Laox/psEMFlIs0ibOsj9OTfxmR0Ye0ugR5v1Ts9aHPOGPzVXfsCVyDw0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwJfTXa2WYucgm6m2cBybBgbmN9Lbg6oh2ofAQYnUp94SN/fARt
	F6J/BmRf7uJXMNOr1yewl/OUf9ITrjRjH0gVH3lJQmzC+6Eu6XU3IXnOmQ+9KqJfZw==
X-Gm-Gg: ASbGnctzyhyApabscBO5pEo766WWDpI4pQWyr+yG6nK51RT9p/+VAeeypHQ1LDlRrf/
	02k4Hkdmx42jFHU/O6mNeOWtpQzQwHp/SDi1htU+S//Gjv7GkQ51fUvdQ6j7PvqKRnjB+Q3+FOf
	UKds/sQG6Myf5p6A0Q7fEkB+ZjUyXaKhfzfl6fwIB4HBhobzJto9pS/uotPpb8QFJaejvQWu935
	+/7cHr82kMAs6Qv2i751YkEChbU8gvIDRF0UzYKR/vrTyyctz2ltamsiOPGwAwfgqXA5yaXULHq
	7nRl+wPbOk/JVbJ1VSLGNnvp/B+qepuQstHTUAYTlnWwkHwYEQMLkt8U8qBRom1N7kR1jLT9cYu
	jWXrmNkNjbEv/Ga0FyWM79vywYTdclnxXimKx6/1HBFoXsBh78iex189cr/V1XlHrOtxHhWJ8f/
	vQMfqut30Jmhg6TOTHnMD04nMlreTYxoRcrhPrJbJm7q6u7w9JJ4TBPD9/2tCakQh2KEbGPyb+/
	iRwCqT61f3lQ8s0aQAvmQ==
X-Google-Smtp-Source: AGHT+IGH2kXVtk/N3N/Dg3EeJbOt8u37moIvhcU7Nkm4tdM0wE9npVXQZ9y8vtxtXB3dn6B6XLUOYw==
X-Received: by 2002:a17:906:c14b:b0:b73:398c:c595 with SMTP id a640c23a62f3a-b767156556amr4621926966b.19.1764591971716;
        Mon, 01 Dec 2025 04:26:11 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:11 -0800 (PST)
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
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 0/8] USB Type-C alternate mode selection
Date: Mon,  1 Dec 2025 12:25:56 +0000
Message-ID: <20251201122604.1268071-1-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
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

USB4 activation can be handled in two distinct ways:
- Treated like an Alternate Mode, using associated sysfs attributes -
`activate` port attribute to enable/disable the mode, `activate` partner
attribute to activate/deactivate the mode, `priority` to keep modes
priority.
- Like a separate USB mode representing in sysfs via `usb_capabily` ports
attribute to enable the mode on the port and `usb_mode` partner attribute
to activate the mode. In this scenario, USB4 is the highest-priority mode,
without the need for a separate priority field. It is put on the top of the
preferred list if it is supported by the partner (partner->usb_capability
has USB_CAPABILITY_USB4 bit set) and is supported and enabled on the port
(port->usb_mode is USB_MODE_USB4).

This patch series implements the second approach. It identifies the USB4
mode via its SVID 0xFF00. Instead of using the typec_altmode_ops activate()
function, activation is handled via the typec_operations enter_usb_mode()
function.
Mode selection is initiated only once during partner registration, and only
if the port driver provides support for this feature. Subsequent
mode-switching activities can be managed via existing sysfs entries. Any
modifications to altmode priorities are relevant only to future
connections.

This series was tested on an Android OS device with kernel 6.17, PDC:
TI TPS6699, Realtek RTS5453.
This series depends on the 'USB Type-C alternate mode priorities' series:
https://lore.kernel.org/all/20251124124639.1101335-1-akuchynski@chromium.org/ 

Andrei Kuchynski (8):
  usb: typec: Implement mode selection
  usb: typec: Integrate USB4 into the mode selection process
  usb: typec: Introduce mode_selection bit
  usb: typec: ucsi: Support mode selection to activate altmodes
  usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
  usb: typec: ucsi: Implement enter_usb_mode operation
  usb: typec: ucsi: Support for Thunderbolt alt mode
  platform/chrome: cros_ec_typec: Enforce priority-based mode selection

 drivers/platform/chrome/cros_ec_typec.c      |  47 ++-
 drivers/platform/chrome/cros_typec_altmode.c |   8 +-
 drivers/usb/typec/Makefile                   |   2 +-
 drivers/usb/typec/altmodes/displayport.c     |   6 +-
 drivers/usb/typec/altmodes/thunderbolt.c     |   2 +-
 drivers/usb/typec/class.c                    |   1 +
 drivers/usb/typec/class.h                    |   2 +
 drivers/usb/typec/mode_selection.c           | 308 +++++++++++++++++++
 drivers/usb/typec/ucsi/Makefile              |   4 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c        |  44 +++
 drivers/usb/typec/ucsi/thunderbolt.c         | 199 ++++++++++++
 drivers/usb/typec/ucsi/ucsi.c                |  56 +++-
 drivers/usb/typec/ucsi/ucsi.h                |  27 ++
 include/linux/usb/typec.h                    |   1 +
 include/linux/usb/typec_altmode.h            |  43 +++
 15 files changed, 728 insertions(+), 22 deletions(-)
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c

-- 
2.52.0.158.g65b55ccf14-goog

