Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6017CA
	for <chrome-platform@lists.linux.dev>; Wed, 12 Oct 2022 04:09:58 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so924655pjl.0
        for <chrome-platform@lists.linux.dev>; Tue, 11 Oct 2022 21:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Jp/SlFFCMnEqsPO2g0Uz7D7qlR6JXLE91xSSG+WAMc=;
        b=c+CI1oX/GK7oQoDAFXFEIeFq+n5gebCxncSL823QuPOrI3EDyL21744NZE4Jm6raOD
         CR2/zIS9C7QVPX4PJzsve0ZFu4ayMbk7dQm8Xza/royFj1YDTXcuj5ADIj8d9gIfGZ39
         HC37sSNHYUT2ELEs9XscBxLK46UcF2O363xiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jp/SlFFCMnEqsPO2g0Uz7D7qlR6JXLE91xSSG+WAMc=;
        b=ofqaq0eP7a95wCXd9V/TLaz/VPs53ejP1WcT6uHOaL558Lo7IWqpPQSNn7Ro6h7Us0
         WOu3MaCKxKfaSn+dAQhNkG2GjZlB1FWFfGXslD2lvMvFSvD2i2vnEh/BhGo83t8lZR5s
         jbUuhSyfvFy2KhweuoeyTJBh997VQzOcdC6DkqgXsikVmD0nHYx+0hBUG7hHEuAQx5eB
         3ud2uefpv8Zoc9L4W1PTXEAPaUmKMmznmXnn3awjR0aV/ffv4PElDrTn7DIOIu+vtk2Q
         1/em93EVJA2ycJfAGrQBzStLGOYKIyjzZl/FBWRYYVWndoEcMDLsk0u/RN/N7KBHWlsc
         LV0A==
X-Gm-Message-State: ACrzQf0mCu8s0JkfA4oCRcxyQwUVhVZvEGWFFXAYABnVVQvBKxzeuEqO
	xPNloDX71IEyNJKBRX1tgO88esPH96Zn6LzJ
X-Google-Smtp-Source: AMsMyM4Vb6519yEaSc6tKHm4MULKtZ9uPf/0ltYaqpMpw9hNlY92DquROq/RqFfhafpl8bOivlElJQ==
X-Received: by 2002:a17:903:509:b0:179:ffcf:d275 with SMTP id jn9-20020a170903050900b00179ffcfd275mr27545911plb.150.1665547797438;
        Tue, 11 Oct 2022 21:09:57 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:4704:5b50:96e5:620f])
        by smtp.gmail.com with UTF8SMTPSA id w12-20020a170902e88c00b00176ba091cd3sm9448702plg.196.2022.10.11.21.09.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 21:09:56 -0700 (PDT)
From: Dan Callaghan <dcallagh@chromium.org>
To: chrome-platform@lists.linux.dev
Cc: LKML <linux-kernel@vger.kernel.org>,
	=?UTF-8?q?Sami=20Ky=C3=B6stil=C3=A4?= <skyostil@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dan Callaghan <dcallagh@chromium.org>
Subject: [PATCH v5 0/1] Add a driver for the ChromeOS human presence sensor (HPS)
Date: Wed, 12 Oct 2022 15:09:17 +1100
Message-Id: <20221012040918.272582-1-dcallagh@chromium.org>
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a driver for the ChromeOS human presence sensor
(a.k.a. HPS) device, attached on the I2C bus. The sensor is a
hardware-isolated module which reports a high-level presence signal,
e.g., whether there is person in front of the computer or not.

The driver exposes the device to userspace as a character device, which
can be used to control the power state of the device. The driver
automatically turns power off to the sensor unless a process is using
it.

More information about HPS, its firmware and communication protocol can
be found at
https://chromium.googlesource.com/chromiumos/platform/hps-firmware.

Changes in v5:
- Updated MAINTAINERS.

Changes in v4:
- Simplified open/release pm logic.
- Renamed device to "cros-hps".
- Stylistics cleanups.

Changes in v3:
- Moved from drivers/misc to drivers/platform/chrome.

Changes in v2:
- Removed custom ioctl interface.
- Reworked to use miscdev.

Sami Kyöstilä (1):
  platform/chrome: add a driver for HPS

 MAINTAINERS                            |   6 +
 drivers/platform/chrome/Kconfig        |  10 ++
 drivers/platform/chrome/Makefile       |   1 +
 drivers/platform/chrome/cros_hps_i2c.c | 151 +++++++++++++++++++++++++
 4 files changed, 168 insertions(+)
 create mode 100644 drivers/platform/chrome/cros_hps_i2c.c


base-commit: 8edd2752b0aa498b3a61f3caee8f79f7e0567fad
-- 
2.38.0.rc1.362.ged0d419d3c-goog

