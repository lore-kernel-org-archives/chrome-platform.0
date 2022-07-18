Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617797E9
	for <chrome-platform@lists.linux.dev>; Mon, 18 Jul 2022 05:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C45FC341C0;
	Mon, 18 Jul 2022 05:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658121007;
	bh=mVVWFneBEwFS1D+cOx09mi60FcdTs4CohcVB8aTEipA=;
	h=From:To:Cc:Subject:Date:From;
	b=eQZX+2XVHydJL5GxCKGi+/icT8M84zsa37GHrSnX/VvfBAajY7bUg/TIilmuLHa3W
	 Ongo7mZqJXGjLrCKgNc+fIn28DdxunQRLvMN/ZicQhwMmjbUjqcBqRJKtTKwkt+kvf
	 MN5e/1llvllWZ9ZKX8vpmW/TcOnApmpKwHeFQ+GTwHDjKpIDsnyf08X3Prgbl/cvAc
	 o3AwJoTZcM/XY323CRseaWD9z4SdruR1PBCCIG+XE9kQSxtxcj4wFfynAWKSZoU+mI
	 JxYX9aw+OM8fb21gpJmJ/82XOI56LZ8YMeE69xPSbNa8/OmdsPJe2MFHLLcGBM6xZO
	 73lUjszyGvX2g==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] platform/chrome: Kunit tests and refactor for cros_ec_cmd_xfer()
Date: Mon, 18 Jul 2022 05:09:04 +0000
Message-Id: <20220718050914.2267370-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.37.0.170.g444d1eabd0-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 1st patch fixes an issue that cros_kunit_ec_xfer_mock() could return
garbage bytes for `msg->result` if the mock list is empty.

The 2nd ~ 6th patches add Kunit tests and refactors for cros_ec_cmd_xfer().

The last 4 patches change the behavior a bit by altering return codes.


Asynchronous mechanism in EC protocol:
EC returns EC_RES_IN_PROGRESS if the host command needs more time to
complete.  It saves the result into `saved_result` once the command
completed[1].

By design, AP should send another command EC_CMD_RESEND_RESPONSE for
getting the result from the previous pending command[2].  The mechanism
was only designed for commands that don't need responses[3].

However, the kernel code doesn't have such logic when dealing with
EC_RES_IN_PROGRESS.

The series doesn't fix it but leave it as is.  I doubt there is no existing
use case.

[1]: https://crrev.com/9b80051e01872d8cae86fff999b5d31a0bea985b/common/host_command.c#113
[2]: https://crrev.com/9b80051e01872d8cae86fff999b5d31a0bea985b/common/host_command.c#748
[3]: https://crrev.com/9b80051e01872d8cae86fff999b5d31a0bea985b/common/host_command.c#126


Return value overridden in cros_ec_send_command() if asynchronous:
By original intention, cros_ec_send_command() returns number of available
bytes of input payload.

When it falls into asynchronous path (i.e. EC_RES_IN_PROGRESS), both return
value and `msg->result` will be overridden by the subsequent
EC_CMD_GET_COMMS_STATUS.

The series doesn't fix it but leave it as is.

Tzung-Bi Shih (10):
  platform/chrome: cros_kunit_util: add default value for `msg->result`
  platform/chrome: cros_ec_proto: add "cros_ec_" prefix to
    send_command()
  platform/chrome: cros_ec_proto: add Kunit tests for cros_ec_cmd_xfer()
  platform/chrome: cros_ec_proto: add Kunit tests for
    cros_ec_send_command()
  platform/chrome: cros_ec_proto: separate cros_ec_xfer_command()
  platform/chrome: cros_ec_proto: separate cros_ec_wait_until_complete()
  platform/chrome: cros_ec_proto: change Kunit expectation when timed
    out
  platform/chrome: cros_ec_proto: return -EAGAIN when retries timed out
  platform/chrome: cros_ec_proto: add Kunit test for empty payload
  platform/chrome: cros_ec_proto: return -EPROTO if empty payload

 drivers/platform/chrome/cros_ec_proto.c      | 102 +++--
 drivers/platform/chrome/cros_ec_proto_test.c | 443 +++++++++++++++++++
 drivers/platform/chrome/cros_kunit_util.c    |  27 +-
 drivers/platform/chrome/cros_kunit_util.h    |   5 +
 4 files changed, 530 insertions(+), 47 deletions(-)

Changes from v1 (https://patchwork.kernel.org/project/chrome-platform/cover/20220628024913.1755292-1-tzungbi@kernel.org/):
- Drop "platform/chrome: cros_ec_proto: change Kunit expectation for EC errors"
  and "platform/chrome: cros_ec_proto: return standard error codes for EC
  errors" because they could break existing ABI.
- Add "platform/chrome: cros_kunit_util: add default value for `msg->result`".

-- 
2.37.0.170.g444d1eabd0-goog

