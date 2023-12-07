Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB430CE2
	for <chrome-platform@lists.linux.dev>; Thu,  7 Dec 2023 09:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YwpB98aG"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-5caf61210e3so6954767b3.0
        for <chrome-platform@lists.linux.dev>; Thu, 07 Dec 2023 01:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940078; x=1702544878; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XjhlNxQ1wUWjraV9iPdtTW5x0sxYSEYMRYfsr8frK4s=;
        b=YwpB98aGcmrhCxKJ/6knPEvOUu6iVVRxG1GR37N04Bow3xdASTc4GQqHkvNgTgRkx1
         Km2h4e3cmNi9nGtQru7aWLrHe27iNfd+ptlW1DHuMKo5z+aA9JnFEhTnJeTV4Fe+Kj4e
         pqfAnMHEerNkqv0LTnXTXRnhHaHMNwioI96p0FNFvYdtVdhSiIXbix5Mt5fti9IBbTmT
         vnlmwrwV4INKPCs5joTeNJx2k0mDbS3f0GAfL1al/2ckiQvFN8Q4+uoeC+GGzMwF+au9
         zuy960RGz//GOA0U9lcjCXe35F2+KAVLXer4sof3WKnLxCXGqt/T+h1H2qLciiv9/bXU
         9nqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940078; x=1702544878;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XjhlNxQ1wUWjraV9iPdtTW5x0sxYSEYMRYfsr8frK4s=;
        b=C67IZT57V4/DwCaZJi5YY0NaN2uQX0wn5r8rdGZIHUUOd31zhZ5e16qloAmD2vH9lw
         AgVQuAk0z+PHyqKnXxWBTE+qjasPNixMjxuvkPyTl0nJG9kgZCz1aSEmmLGwzJ5I2fG+
         f/Ht61hbsNsWyopLiinV4cyITC1/6CywdHsdZ7n1wUc1NY9WLsjmjClnKYxfYK+4PbFf
         wPSkUHjVrUUxfzShM9CKawOA2MLV81Luvzre0u6s4S16p2FKjJ//N29cyQkb3ARumAsL
         hlj4Gyu73f4M7MPIZZByC0LUi35oYSI9aGDRJ9TkX3m/AiVCm/UIMk7RXEtnWOo5JL7v
         ppFQ==
X-Gm-Message-State: AOJu0Yxm5Ttn7ynJQFUl19e4/jYJsRpm/yxCgwbpY4J61P0lNaO84KQx
	yj4dk47zAgNp7du52qq2Lm1DJtYlAAzmYjE=
X-Google-Smtp-Source: AGHT+IGBamj/zy/n72vCz2neXuhEsyt1AsF7cIaDJq4VKFEX0D9upq9VMWa9ajffy7iqLfGYkj134Vm8PyEiiG4=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a81:b627:0:b0:5d4:1b2d:f43f with SMTP id
 u39-20020a81b627000000b005d41b2df43fmr36440ywh.6.1701940077775; Thu, 07 Dec
 2023 01:07:57 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:31 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548; i=rdbabiera@google.com;
 h=from:subject; bh=YbXxf5+Kewbv+6BZn0oI5JwVjybhzPVx1ZrpByB9dhg=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3VHOP479Nok3jTry+eq8B7fV1AQ+LJzDe8MuRqZLv
 OR2tqBhRwkLgxgHg6yYIouuf57BjSupW+Zw1hjDzGFlAhnCwMUpABOxU2L4KnHlzXk35rsubaGd
 AX/XfOzPeRpSc36W3Q9Nqwerf9SUMPz3efamRew2302Vq+q+sntkDROebX81g4etmskysqZa/yA vAA==
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-12-rdbabiera@google.com>
Subject: [PATCH v1 00/10] usb: typec: add SOP' support to the tcpm and alt
 mode drivers
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Extend the TCPM's functionality to include support for SOP' messages.
This feature is opt-in: TCPCI chip drivers opt into sending and receiving
SOP' messages. TCPCI drivers will also be expected to take the SOP frame
type in order to process SOP' messages within the TCPM. The Maxim TCPCI
driver implements this in Patch 2.

Discover Identity, Discover SVIDs, Discover Modes, and Alt Mode SVDM
support are included within the patchset. Because the port is expected to
be the Vconn source in order to communicate with the cable, TCPCI chip
drivers opt into performing a Vconn swap after Discover Identity on SOP
before performing Discover Identity on SOP'.

Alt Mode drivers can direct SVDMs towards the port partner or cable plug.
DisplayPort Alt Mode adds support for Enter Mode, Configure, and Exit Mode
commands over SOP' in Patch 10.

RD Babiera (10):
  usb: typec: bus: provide transmit type for alternate mode drivers
  usb: typec: tcpci: enable reception of SOP' messages
  usb: typec: tcpm: process receive and transmission of sop' messages
  usb: typec: tcpm: add control message support for SOP'
  usb: typec: tcpci: add attempt_vconn_swap_discovery callback
  usb: typec: tcpm: add discover identity support for SOP'
  usb: typec: tcpm: add state machine support for
    SRC_VDM_IDENTITY_REQUEST
  usb: typec: tcpm: add mode data message support for SOP'
  usb: typec: altmodes: add typec_altmode_get_cable_svdm_version
  usb: typec: altmodes/displayport: add SOP' support

 drivers/platform/chrome/cros_typec_vdm.c  |   12 +-
 drivers/usb/typec/altmodes/displayport.c  |  175 +++-
 drivers/usb/typec/bus.c                   |   17 +-
 drivers/usb/typec/class.c                 |   42 +-
 drivers/usb/typec/class.h                 |    1 +
 drivers/usb/typec/tcpm/tcpci.c            |   26 +-
 drivers/usb/typec/tcpm/tcpci_maxim.h      |    1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c |   37 +-
 drivers/usb/typec/tcpm/tcpm.c             | 1014 ++++++++++++++++++---
 drivers/usb/typec/ucsi/displayport.c      |   18 +-
 include/linux/usb/pd.h                    |    1 +
 include/linux/usb/pd_vdo.h                |    8 +-
 include/linux/usb/tcpci.h                 |   13 +
 include/linux/usb/tcpm.h                  |   16 +-
 include/linux/usb/typec.h                 |    3 +
 include/linux/usb/typec_altmode.h         |   36 +-
 16 files changed, 1214 insertions(+), 206 deletions(-)


base-commit: 5e4c8814a431d21bfaf20b464134f40f2f81e152
-- 
2.43.0.rc2.451.g8631bc7472-goog

