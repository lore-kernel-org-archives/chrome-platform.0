Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B5A23A7
	for <chrome-platform@lists.linux.dev>; Mon, 13 Mar 2023 09:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B0BC433EF;
	Mon, 13 Mar 2023 09:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678700679;
	bh=FC5amKWnb9Pm1D9GG/NEtGdRI6u8AE3xg49EGjr2Xj0=;
	h=From:To:Cc:Subject:Date:From;
	b=ehouEM/gpToluFNWDRvGVi1P62dF8A64CInjkTZN+ibVAo7vAnpBoa02sFGxXoUKx
	 NAs9DobFSAZp1526WTeSrFBAPvAMobwC47MLkNOth6BPeyaOyxGjJSgkrveQ0pA1Ad
	 vzWt1pxvbftiix8H353jFaLT/ftWfQh49jKtvDAOalOHmQ+GiRB0joOXgqO1BLD1kZ
	 2bnFlnhGmEBRW0+B/Fc+0porKGzXtAluIqBqpcVxmZ9dKsWU8hYUibEtiONin+yTaP
	 673FymCd+Nabp6AkTkEaP+6pndh2PyiM5/Bp+XM/KkpqEnOI9jny4pZ/f8l+gOPsZU
	 YxZNX0Z35ZZRw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	guillaume.tucker@collabora.com,
	denys.f@collabora.com,
	ricardo.canuelo@collabora.com
Subject: [PATCH 00/14] cros-ec-tests: fix some exceptions and clean-ups
Date: Mon, 13 Mar 2023 17:44:17 +0800
Message-Id: <20230313094431.507952-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.40.0.rc1.284.g88254d51c5-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series changes cros-ec-tests[1].

It applys some clean-ups and fixes obvious errors.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/cros-ec-tests.git/

Tzung-Bi Shih (14):
  lava_runner: rename to LavaTestResult
  lava_runner: use TextTestRunner
  lava_runner: use TextTestResult
  lava_runner: respect to verbosity flag from unittest framework
  helpers/sysfs: fix NameError
  helpers/mcu: fix ResourceWarning on /dev/cros_ec
  cros_ec_pwm: fix ResourceWarning on /sys/kernel/debug/pwm
  treewide: use context manager on file objects
  cros_ec_pwm: use RE to search EC backlight PWM
  helpers/mcu: fix packet too long error
  helpers/mcu: fix EC_CMD_GET_FEATURES usage
  treewide: remove "r" in open() if reading mode
  treewide: don't use "+" operator for constructing paths
  treewide: don't use "+" operator for concatenating strings

 cros/helpers/kernel.py       |  5 ++-
 cros/helpers/mcu.py          | 57 ++++++++++++++------------------
 cros/helpers/sysfs.py        | 16 ++++-----
 cros/runners/lava_runner.py  | 64 +++++++++++++++---------------------
 cros/tests/cros_ec_accel.py  | 13 ++++----
 cros/tests/cros_ec_extcon.py | 11 ++++---
 cros/tests/cros_ec_pwm.py    | 58 +++++++++++++-------------------
 cros/tests/cros_ec_rtc.py    |  8 ++---
 setup.py                     |  2 +-
 9 files changed, 99 insertions(+), 135 deletions(-)

-- 
2.40.0.rc1.284.g88254d51c5-goog

