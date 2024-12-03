Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB101F6661
	for <chrome-platform@lists.linux.dev>; Tue,  3 Dec 2024 14:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733235835; cv=none; b=NF4Ge9PaOYnFMXkKzeAztsjt9WIATOV6BWpfzM28G1iE59GhgKzAxfAhcbxlDFTurEP2Y4HB0yAT5d8HgaKkQ0Phk0/O4XfMf4LYruPeKtynVgD9XavGY8p28CEX+tCFxICwetYdgHW54rPCgOILPS/nDADvYZrT4RaRyRftDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733235835; c=relaxed/simple;
	bh=LiwZqTaCwtPYbVUbQgJB4TamMAu7Ry1f9Ko8KBJxWS8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DbEfNy3nDna5KN1x/b3w1QHBEa0ZZxBaI8NOkCuuXalH6S5pUr7QjLY7SSlnf1FJDVtgTIC28zTRV5COAEMfl05z4VN/z6njcs3SnsZUtUqv1RIw7GHTGU8lVnqfAT0prpQC/F0eSdR6TffpGZJCrJkVp/B20g3bM58/6E5NJNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cwKnUGSl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cwKnUGSl"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa560a65fd6so944240466b.0
        for <chrome-platform@lists.linux.dev>; Tue, 03 Dec 2024 06:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733235832; x=1733840632; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M2lWSxr19Z7HZJY/3NWn0r9Ksm2XuDvm2IGMEOHYfkE=;
        b=cwKnUGSlkfUSGpsVDWzqHrFdBLgWEhPeEzf0sEgRGDspbsn1Uk09Mt6KsDhkw476bg
         MbfwxkLGvGtQpQHUueMkUPDsylv1TzuZ/d2Vfi3hiuMZaBLTco1q1bBvzOvy31SJbPzd
         1kibNS/nqRe/MGuxxsBfgLsN30b3HbvhK0E6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733235832; x=1733840632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2lWSxr19Z7HZJY/3NWn0r9Ksm2XuDvm2IGMEOHYfkE=;
        b=PtQvJ+pKs5RSeQf3duiSdg6zygUy1V+GdKKV7jm5OwN5c6hYMIaagm2fVEbj8YNNCg
         s7MkE417eWF+tpo9dEwq/gzwK3l/e+pfFWBp4XHH9Ge83isXa0Hctv3n4dhsqPyzFiSv
         k7SjLoCNOzH9qwAEAa1agq/GDFGSu2z/xeZyrWya6F+gscTNhX5R84OWXVEd6Y3e5tia
         5ylFX/8PysBX9CygUgpcj2ymAWkIoAlUus0m6is82jyTYjzKd692x1gmkWXp6SoXYgWp
         dzo5U3+tj7uZ+FNb0zb9OKK5xCJhSzO43aQ3uiOk6j8gRrnxGc94AUhkm9rNbFzT5Fqh
         TpZg==
X-Forwarded-Encrypted: i=1; AJvYcCW3bCE0zHtkHo5npJvYWJRMoAS9v1XlqbouQ60hZU8xi2uc1mfAx+sm72DmtfsueMoLrNnAOk8ECvNuwerkfXM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzY+rcDIfW3N0eu14KjeYW/YUw97h/+Zq+PcOjhz2VTt55j1Wrz
	Xhn/3NGDvJbh4AMc8pqr+gcznZbujj+CM6AurKiEMycgV6ziV4s2e+03vOSq
X-Gm-Gg: ASbGncs0DaTXGGEFu5C9uTq44hs9CLAFbhiyDtd1ibcl9M12zdfZ3SRDHizhYNGl6ms
	a336cKvZFB00qdqIHokN1cD/MzV9neWX3Peu7kIfRlZT2jwtuFBuzo7Z2MFeFv6GSMMdeVT/5dD
	uln+q14ojpaCeLMbfNvNw5bUP5Bs5yZydS/urVGFIWvh3fEE51JnqglJJ8vvW0Zx+OBlAwmms/6
	heedIb4PBRCNhDFpmqBxsx4qFek2+t/xkxjqdo4LziKbRB0bvexuPQ9gFIA0NZmV6nX0MguLdtQ
	qQ64HvpadP2WwycoywfgxtQsSuO+oIOaFEg=
X-Google-Smtp-Source: AGHT+IEceZ72opQVXCjcIbIhEScJB0UgFCekVOen2KPTUnFVSLZvTRkCNJqKeuGt+mmCYDf5q7M8Mg==
X-Received: by 2002:a17:906:311b:b0:aa5:27da:104a with SMTP id a640c23a62f3a-aa5f72cb6c3mr336661866b.15.1733235832185;
        Tue, 03 Dec 2024 06:23:52 -0800 (PST)
Received: from ukaszb-ng.c.googlers.com.com (103.45.147.34.bc.googleusercontent.com. [34.147.45.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6a64sm618272466b.96.2024.12.03.06.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 06:23:51 -0800 (PST)
From: =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v9 0/2] usb: typec: Implement UCSI driver for ChromeOS
Date: Tue,  3 Dec 2024 14:23:12 +0000
Message-ID: <20241203142314.3892422-1-ukaszb@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series implements a UCSI ChromeOS EC transport driver. 
The ChromeOS EC is expected to implement UCSI Platform Policy
Manager (PPM).

---
Changes in v9:
- Squash "usb: typec: cros_ec_ucsi: Recover from write timeouts" commit
into "usb: typec: ucsi: Implement ChromeOS UCSI driver".
- Replaced out label in cros_ucsi_sync_control() with switch statement.
- Link to v8: https://lore.kernel.org/linux-usb/20241128232035.1525978-1-ukaszb@chromium.org/ 

Changes in v8:
- Set .sync_control in cros_ucsi_ops struct to point
to ucsi_sync_control_common().
- Added explanation why complete() is used instead of resume()
in cros_ucsi_pm_ops struct.
- Updated s/miliseconds/milliseconds/.
- Link to v7: https://lore.kernel.org/linux-usb/20241115155234.1587589-1-ukaszb@chromium.org/ 

Changes in v7:
- Dropped the following commits for now as I want to focus
on upstreaming cros_ec_ucsi driver first. Then I will get
back to the topic of trace events and netlink:
  "usb: typec: cros_ec_ucsi: Add trace events"
  "usb: typec: cros_ec_ucsi: Add netlink"
- Squashed "usb: typec: cros_ec_ucsi: Use complete instead of resume"
into "usb: typec: ucsi: Implement ChromeOS UCSI driver".
- Added "usb: typec: cros_ec_ucsi: Recover from write timeouts" commmit.
- Added usage of common functins ucsi_sync_control_common()
and ucsi_notify_common().
- Commits:
  "platform/chrome: Update EC feature flags"
  "mfd: cros_ec: Load cros_ec_ucsi on supported ECs"
  "mfd: cros_ec: Don't load charger with UCSI"
landed in the tree https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/log/?h=for-mfd-next    
- Link to v6: https://lore.kernel.org/linux-usb/20240910101527.603452-1-ukaszb@chromium.org

Changes in v6:
- Reverted to type names uint*_t in cros_ec_commands.h in order 
to be consistent with type names used in other parts of the file.
- Updated comments in cros_ec_commands.h related to UCSI.
- Added missing sign-offs.
- Fixed memory leak in cros_ucsi_async_control() by moving
ec_params_ucsi_ppm_set request buffer to stack.
- Replaced cros_ucsi_read with cros_ucsi_read_cci in cros_ucsi_work().
- Updated changes in v5, it was missing information related to
commits addition:
  platform/chrome: Update EC feature flags
  usb: typec: cros_ec_ucsi: Use complete instead of resume
  mfd: cros_ec: Load cros_ec_ucsi on supported ECs
  mfd: cros_ec: Don't load charger with UCSI
- Link to v5: https://lore.kernel.org/r/all/20240903163033.3170815-1-ukaszb@chromium.org/

Changes in v5:
- Increased WRITE_TMO_MS to 5000.
- Replaced DRV_NAME with KBUILD_MODNAME.
- Added comments for WRITE_TMO_MS and MAX_EC_DATA_SIZE defines.
- Refactored cros_ucsi_async_control() to dynamically allocate memory
for a message to EC instead of allocating the message on stack.
- Replaced type names uint*_t with u*.
- Removed ret variable in cros_ucsi_work().
- Updated ucsi_operations interface to align with changes introduced in
  v6.11.
- Replaced test_bit() with test_and_clear_bit() in cros_ucsi_work().
- Updated EC feature flags in commit "platform/chrome: Update EC feature
  flags".
- Added new commit "usb: typec: cros_ec_ucsi: Use complete instead
of resume".
- Added trace events in commit "usb: typec: cros_ec_ucsi: Add trace
  events".
- Added netlink in commit "usb: typec: cros_ec_ucsi: Add netlink"
for debugging and testing puropses.
- Added new commit "mfd: cros_ec: Load cros_ec_ucsi on supported ECs".
- Added new commit "mfd: cros_ec: Don't load charger with UCSI".
- Link to v4: https://lore.kernel.org/all/CAB2FV=6We88NrvN8NZYt8NkMFH9N_ZBGyUWVUpGwPdja2X_+NA@mail.gmail.com/T/

Changes in v4:
- Setup notifications before calling ucsi_register.
- Cancel work before destroying driver data.
- Link to v3: https://lore.kernel.org/r/20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org

Changes in v3:
- Moved driver from platform/chrome to usb/typec/ucsi.
- Used id_table instead of MODULE_ALIAS.
- Split EC header changes into seperate commit.
- Fixes from additional internal reviews and kernel bot warnings.
- Link to v2: https://lore.kernel.org/r/20240325-public-ucsi-h-v2-0-a6d716968bb1@chromium.org

Changes in v2:
- No code or commit message changes.
- Added drivers/platform/chrome maintainers for review.

Pavan Holla (2):
  platform/chrome: Update ChromeOS EC header for UCSI
  usb: typec: ucsi: Implement ChromeOS UCSI driver

 MAINTAINERS                                   |   7 +
 drivers/usb/typec/ucsi/Kconfig                |  13 +
 drivers/usb/typec/ucsi/Makefile               |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c         | 335 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  28 +-
 5 files changed, 383 insertions(+), 1 deletion(-)
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

-- 
2.47.0.338.g60cca15819-goog

