Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8563B28
	for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 16:59:46 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id z2so4406986iow.8
        for <chrome-platform@lists.linux.dev>; Thu, 17 Feb 2022 08:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett-net.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlPBHZSe/TPAnLSNPlhYDZrx8BkXEH/TLQNmJ832ryY=;
        b=MrNmC5lGaUo6j48SsWF/GdQYjSnCgojo7us0cqh7BpkBagDq1NXlKDLLL7KjRXqs0E
         KFEsHO+bqjzV7nq8gYEPKOKVSHVjxAUZ2H1w6qMu4lYIViJY6FNn6bbtwlYyx9Z2GsLv
         30C3k4luQhVZzGced+WWNorvKwLftsqqM7/dTVIM+2MN4cIcaFrHb/wzqfoHavXgWZoj
         bSCEohTq8GHhJJKPCcIRr/P1tCqFSC/0Wx6g+Hbx+1aQmK36KSI24JllsR3eXfykmNE6
         XrCDL/OdVudSXneOcxoiUqSIVKWbEzcRrqKOQE7ldZ9amokyYaJwdD51HRTuFr6e3Dye
         E/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WlPBHZSe/TPAnLSNPlhYDZrx8BkXEH/TLQNmJ832ryY=;
        b=u0kTcnRBLMumVWFCLb68ieZtwFwYlFo2fzTXbmE3mwiMNBzBYf5slem7oPMxx+OiIY
         Dun2qZOnPIC2izPrDDlek4+NG9F5Yqv5O36MpANY+Pgm0MXzz3T/JFOWi2TY+2L2QBxT
         T63nmuPk91CrkywucdyZnJiBEaCZLWuzi4MSZKHsFcmP1gn/UzkMXKkdQyS5y2h8hJvX
         /xZqRsxogaPjsaZ6L4fwlXZlcr/B+3V4l7QRayHgYOcXT2tIhdQRyJy2gUicoalgmPhe
         k8rNoWrWa9QadqKJ7jDqCI5BaZ9/a5LtarbPeCnk6PbA082wBsBMoj5Gy6dqQr1xZslC
         649g==
X-Gm-Message-State: AOAM5313j0b0HHwYsB2sw+5/d9k5v0BtlzMLqExWeoyxxZSGLK7B5R1K
	qGOzghC2flxGohQq+W5y4SKnR9IwFVz2GIrb
X-Google-Smtp-Source: ABdhPJx9cWrRBgIJMkbbL1r55IWU/EeOdaUMabrEmvg8Y5I96bPPgZtqfKoIn/JjwQ9U9bNbbPVTnw==
X-Received: by 2002:a02:cc55:0:b0:311:bd14:fe74 with SMTP id i21-20020a02cc55000000b00311bd14fe74mr2538408jaq.84.1645117185163;
        Thu, 17 Feb 2022 08:59:45 -0800 (PST)
Received: from rigel.delfino.n.howett.net ([2600:1700:df50:a7cf::725])
        by smtp.googlemail.com with ESMTPSA id a15sm2108346ilq.24.2022.02.17.08.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:59:44 -0800 (PST)
From: "Dustin L. Howett" <dustin@howett.net>
To: chrome-platform@lists.linux.dev
Cc: Benson Leung <bleung@chromium.org>,
	Aseda Aboagye <aaboagye@chromium.org>,
	Tzung-Bi Shih <tzungbi@google.com>,
	Michael Niksa <michael.niksa@live.com>,
	"Dustin L. Howett" <dustin@howett.net>
Subject: [PATCH v3 0/2] platform/chrome: add support for the Framework Laptop
Date: Thu, 17 Feb 2022 10:59:28 -0600
Message-Id: <20220217165930.15081-1-dustin@howett.net>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Framework Laptop to the cros_ec LPC
driver.

The Framework Laptop is a non-Chromebook laptop that uses the ChromeOS
Embedded Controller. Since the machine was designed to present a more
normal device profile, it does not report all 512 I/O ports that are
typically used by cros_ec_lpcs. Because of this, changes to the driver's
port reservation scheme were required.

Since this EC driver probes the MEC range first, and uses only the MEC
range if that probe succeeds[^1], we can get by without requesting the
entire port range required by non-MEC embedded controllers until
absolutely necessary.

[^1]: this includes "memory mapped" read - where the traditional LPC EC
requires I/O ports 0x900-0x9FF, the MEC EC multiplexes reads/writes
over the same eight ports, 0x800-0x807.

Changes in v2:
  - Cleaned up the commit subjects per request.
Changes in v3:
  - Sync'd cros_ec_commands.h with the EC changelist at
    https://chromium-review.googlesource.com/c/chromiumos/platform/ec/+/3460548

Dustin L. Howett (2):
  platform/chrome: cros_ec_lpcs: detect the Framework Laptop
  platform/chrome: cros_ec_lpcs: reserve the MEC LPC I/O ports first

 drivers/platform/chrome/cros_ec_lpc.c          | 47 ++++++++++++++-----
 include/linux/platform_data/cros_ec_commands.h | 10 ++--
 2 files changed, 41 insertions(+), 16 deletions(-)

-- 
2.34.1

