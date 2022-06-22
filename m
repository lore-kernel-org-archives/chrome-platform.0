Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AC410F1
	for <chrome-platform@lists.linux.dev>; Wed, 22 Jun 2022 04:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3177C3411B;
	Wed, 22 Jun 2022 04:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655871067;
	bh=0BsWNOfJDzAXL1RFauzW4Eg+bltYhSLXctfjHV6iGfE=;
	h=From:To:Cc:Subject:Date:From;
	b=oKxEJeOEezlW/QtxTKZjCcwDl2r70/PyjadiZiDnRq/lrBceVews4NLkdY/ULqYPb
	 D8QZyoAYiIOSsf+F1kayfyvgnaB08+yPa6wpWxdC5kuTUP+s7tV6GpDHEMHtN5F9I+
	 hhNXVBop8gaDEG3558iMYB2RsIlDJtLV1rnzp4nzADs7l3mJ33r5C/gEevg/rX/dPo
	 MsUj06D4NmYlWeKoAx0090CPa+AiygUvXukZpali1bJxzNSv0w6osDp4RyfhykdEr1
	 QRS16sHyb6P/+au4ksK0SvQoFjwBwC1BEr48rfHO77UmjcnhY0lj6qHScLbVx9zSb0
	 XlXLODAyEHEbg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] platform/chrome: cros_ec_proto: add Kunit tests
Date: Wed, 22 Jun 2022 04:10:33 +0000
Message-Id: <20220622041040.202737-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series add Kunit tests for the rest of exported functions.

The series applies after
https://patchwork.kernel.org/project/chrome-platform/cover/20220615051248.1628156-1-tzungbi@kernel.org/.

Tzung-Bi Shih (7):
  platform/chrome: cros_ec_proto: add Kunit tests for cmd_xfer_status
  platform/chrome: cros_ec_proto: add Kunit test for cros_ec_map_error()
  platform/chrome: cros_ec_proto: add Kunit tests for get_next_event
  platform/chrome: cros_ec_proto: add Kunit tests for get_host_event
  platform/chrome: cros_ec_proto: add Kunit tests for check_features
  platform/chrome: cros_ec_proto: add Kunit tests for get_sensor_count
  platform/chrome: cros_ec_proto: add Kunit test for cros_ec_cmd()

 drivers/platform/chrome/cros_ec_proto_test.c | 694 +++++++++++++++++++
 drivers/platform/chrome/cros_kunit_util.c    |  22 +
 drivers/platform/chrome/cros_kunit_util.h    |   7 +
 3 files changed, 723 insertions(+)

-- 
2.37.0.rc0.104.g0611611a94-goog

