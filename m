Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508483;
	b=IUawa9yNpatyBittpqmuey07I+naOYKGkRV+Y5WVebRT/U4HBmRfoAba3gIlnE9PXm/y
	 WGH+lD0bou85gbHqW/BQzlbIQClKut+klH7gLVsHFk2S4SpGbJjjF9DHhssHd7ASSgLra
	 9DqC5gsFdzHTJAznQ/mHm3+DRlOAWBtIxVvIU3nnw77327IkGc1lKZ+G3pTaqlf2P+dBq
	 hZ0W5WTTk7JP/k73ck/7K19YRLOfRCZ55NAVmEbkWRC9vMn3CQUDZ3P+Ng8RPEpwkkXeg
	 zl8HD24phV7F9llNYRVq7oSDFd310FBSQaIIueAy8QuyNPYtqdA4t8+GGw64J2Po2Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508483;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7CCQicebTvgO0SF8U+ZenTXuEUoMApm+QWlwtmRwu1w=;
	b=vtziYjA3Fx+Bwis8GnnEiZrEbL7XaWqzzPy/c3kjOUh8JJLGyUcpc0JXgeyELHbn3C0d
	 xrC4qixivfG746RgyJVzex3z4pFb0xFIzhTE6lXBhutz/Yjx2/ORwcuvQD5UKp/8tqvb+
	 drdvkeLFdwLsdPKNWkqp6ah7Hnubf68EADZEkDve6lhXuoSdedEy5dq6CANKoBAazqgM7
	 rOidPSee6iu09VJ6/Cku1NBvoXhiIsBJhiLUCenJ92jrZOFFwWUjM0FtxS6oiuZy/E6xS
	 R19uoUlPaxe4HEXIvkvdSEPeYcSG/bUlmxELInb8JXPLmibFSLLRGzGPpd+WyRvvvbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jW3pp+eJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098E9606A31E
	for <chrome-platform@lists.linux.dev>; Tue, 24 Nov 2026 08:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jW3pp+eJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C8B1F000C4;
	Tue, 24 Nov 2026 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508482;
	bh=7CCQicebTvgO0SF8U+ZenTXuEUoMApm+QWlwtmRwu1w=;
	h=From:To:Cc:Subject:Date;
	b=jW3pp+eJHvmhwBopdMd0E/hg9nLKF0uxdLHKKSkuz0FsnGK0RB81lAZ9ycGh7kbTt
	 8ZuoEAiwS4MIMi2aMm0g40f7TPgRiJDFtPOcMfd1DAYT3K8MGaw40ieKQAsBSNlAO6
	 PODJ5wvEwEa8IDwa9lFGhIK1nvefyCLmQpysYd18b3BgEkp+1FLVKxC+mXb9yDxZA3
	 +cgGvcLy9UBosjOcmc5MUkkK7WZEvrLkNVwpn0sfW/ZtliVgPtzzPlZJsEih7iCaIz
	 cSeO9j86+rhdpOJAANPHc4dM3b0zxy1qdhSc1uJxR4FXVZo4KEekAkKJEHf1BD/3UM
	 poYNlr3hxUvIQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Benson Leung <bleung@chromium.org>
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH 0/9] platform/chrome: cros_ec_proto: Harden query_all() and retries
Date: Tue, 24 Nov 2026 08:21:03 +0000
Message-ID: <20261124082112.3361229-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Post: <mailto:chrome-platform@lists.linux.dev>
List-Help: <mailto:chrome-platform+help@lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
List-Owner: <mailto:chrome-platform+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series hardens ChromeOS EC command transmission and
cros_ec_query_all() against transient transport errors (such as -EAGAIN)
and buffer reallocation hazards:

- Patches 1-2: Reset `msg->result` before each transfer and retry
  transient -EAGAIN errors in cros_ec_send_command() and
  EC_CMD_RESEND_RESPONSE polling.

- Patch 4: Reallocate `din`/`dout` safely with devm_krealloc() directly
  when protocol info arrives, preventing `din_size`/`dout_size` OOB
  mismatches, -ENOMEM dangling pointers, and runtime reallocation churn.

- Patch 5: Guard protocol v3-to-v2 fallback so transient errors, v3-only
  transports, or runtime re-queries on registered v3 devices do not
  downgrade the EC to v2.

- Patch 8: Distinguish -EOPNOTSUPP from real transport/protocol errors
  when probing MKBP, host sleep v1, and wake mask, propagating real
  errors and resetting `proto_version` so the next transfer re-queries.

New KUnit test cases and non-breaking test cleanups are kept in separate
patches (patches 3, 6, 7, and 9).  In patch 8, updates to existing KUnit
tests are folded into the code change itself so that the test suite
remains passing at every commit for bisectability.

Tzung-Bi Shih (9):
  platform/chrome: cros_ec_proto: Reset msg->result before sending
    command
  platform/chrome: cros_ec_proto: Retry sending command on -EAGAIN
  platform/chrome: KUnit: Add tests for retrying commands on -EAGAIN
  platform/chrome: cros_ec_proto: Reallocate din/dout buffers atomically
  platform/chrome: cros_ec_proto: Guard protocol v2 fallback
  platform/chrome: KUnit: Update test cases for protocol v2
  platform/chrome: KUnit: Add test cases for protocol fallback
  platform/chrome: cros_ec_proto: Propagate feature probe errors
  platform/chrome: KUnit: Add feature probe unsupported tests

 drivers/platform/chrome/cros_ec_proto.c      | 167 +++++---
 drivers/platform/chrome/cros_ec_proto_test.c | 429 +++++++++++++++----
 2 files changed, 469 insertions(+), 127 deletions(-)

-- 
2.56.1.831.g720f3f5937-goog

