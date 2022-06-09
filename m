Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5345F210B
	for <chrome-platform@lists.linux.dev>; Thu,  9 Jun 2022 08:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C45CC34114;
	Thu,  9 Jun 2022 08:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654764614;
	bh=OosFH16273fdadkKbi7aHx2sr6aFfpoVmI5r3sGa0PA=;
	h=From:To:Cc:Subject:Date:From;
	b=j2v1Ll+98oxBHtKDOFMsBfK7Xi0EqzAJmSAXHVN9FKDtRNDpgdLnXmr0ZS4KP2BIb
	 K9FMsNMiTHpudNbWen0lI1ZjVCdkHP6KNOH2PVxmg7Brpi3DwYvO1QRRjMSoG0l0SO
	 yF2/BFDFn5P/maQBVc17iiTf6CrveWHjPYdEMRMU4k5R8DXpdqI2kgIwiOdAihAQQi
	 wd0tHGDAHqHSm9BCnC+jQ0hx8ldTyvJFS+TY0z4OB2eysE3UFOHfomuGqMPlcTnHVg
	 gxF4z5zJWG+/BMFcYmtKFsiLCU9Zq3pj7cbejIFJsPf00LXbLa8pTsIHgYascpD4nv
	 /j/F7g73uddrg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/21] platform/chrome: Kunit tests and refactor for cros_ec_query_all()
Date: Thu,  9 Jun 2022 08:49:36 +0000
Message-Id: <20220609084957.3684698-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series adds Kunit tests, refactors, and clean-ups for cros_ec_query_all().

Tzung-Bi Shih (21):
  platform/chrome: cros_ec_commands: fix compile errors
-> Fixes compile errors when including cros_ec_commands.h.

  platform/chrome: cros_ec_proto: add Kunit tests for
    cros_ec_query_all()
-> Adds Kunit tests for cros_ec_query_all().  They are baseline tests
   for the following refactor patches.  They are designed to pass current
   code.

  platform/chrome: use macros for passthru indexes
  platform/chrome: cros_ec_proto: assign buffer size from protocol info
-> Refactors.

  platform/chrome: cros_ec_proto: remove redundant NULL check
-> Clean up.

  platform/chrome: cros_ec_proto: use cros_ec_map_error()
-> Changes the internal return code.

  platform/chrome: cros_ec_proto: separate cros_ec_get_proto_info()
-> Move refactor.

  platform/chrome: cros_ec_proto: add Kunit tests for getting proto info
  platform/chrome: cros_ec_proto: handle empty payload in getting proto
    info
-> Test and handle if send_command() returns 0 in cros_ec_get_proto_info().

  platform/chrome: cros_ec_proto: separate
    cros_ec_get_proto_info_legacy()
-> Move refactor.

  platform/chrome: cros_ec_proto: add Kunit test for getting legacy info
  platform/chrome: cros_ec_proto: handle empty payload in getting info
    legacy
-> Test and handle if send_command() returns 0 in
   cros_ec_get_proto_info_legacy().

  platform/chrome: cros_ec_proto: don't show MKBP version if unsupported
-> Minor fix up.

  platform/chrome: cros_ec_proto: return 0 on getting cmd mask success
-> Conform to kernel convention: return 0 on success;
   otherwise, negative integers.

  platform/chrome: cros_ec_proto: add Kunit test for getting cmd mask
    error
  platform/chrome: cros_ec_proto: check `msg->result` in getting cmd
    mask
-> Test and handle if `msg->result` isn't EC_RES_SUCCESS in
   cros_ec_get_host_command_version_mask().

  platform/chrome: cros_ec_proto: add Kunit tests for getting cmd mask
  platform/chrome: cros_ec_proto: handle empty payload in getting cmd
    mask
-> Test and handle if send_command() returns 0 in
   cros_ec_get_host_command_version_mask().

  platform/chrome: cros_ec_proto: return 0 on getting wake mask success
-> Conform to kernel convention: return 0 on success;
   otherwise, negative integers.

  platform/chrome: cros_ec_proto: add Kunit test for getting wake mask
  platform/chrome: cros_ec_proto: handle empty payload in getting wake
    mask
-> Test and handle if send_command() returns 0 in
   cros_ec_get_host_event_wake_mask().

 drivers/platform/chrome/Kconfig               |    6 +
 drivers/platform/chrome/Makefile              |    1 +
 drivers/platform/chrome/cros_ec.c             |    3 -
 drivers/platform/chrome/cros_ec_proto.c       |  291 ++--
 drivers/platform/chrome/cros_ec_proto_test.c  | 1402 +++++++++++++++++
 drivers/platform/chrome/cros_ec_trace.h       |    8 +-
 drivers/platform/chrome/cros_kunit_util.c     |   98 ++
 drivers/platform/chrome/cros_kunit_util.h     |   36 +
 .../linux/platform_data/cros_ec_commands.h    |    4 +-
 include/linux/platform_data/cros_ec_proto.h   |    3 +
 10 files changed, 1700 insertions(+), 152 deletions(-)
 create mode 100644 drivers/platform/chrome/cros_kunit_util.c
 create mode 100644 drivers/platform/chrome/cros_kunit_util.h

Changes from v3:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220608110734.2928245-1-tzungbi@kernel.org/)
- Drop 2 patches regarding `din` and `dout`.  One of them crashes kernel.
- Fix typo in commit message.

Changes from v2:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220607145639.2362750-1-tzungbi@kernel.org/)
- Split patches into smaller pieces.

Changes from v1:
(https://patchwork.kernel.org/project/chrome-platform/cover/20220606141051.285823-1-tzungbi@kernel.org/)
- Fix review comments.
- Split and reorder patches.

-- 
2.36.1.255.ge46751e96f-goog

