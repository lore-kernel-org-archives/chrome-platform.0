Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77277DA95
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073427; cv=none; b=aedSnNEdDH2KjGOEETlAdibWeFRy2h+VYTq3QD0C+LqG0Ff+FC0xPBP0jaYOTmwM6wwBIDsw9kziyVnaZg7G9KL8I+queexkXDbEq9FtxBDbHtXHGyNV1wRZPUHJKpG6gAQUdL7exEd9IBr8aFP3UHAzuktgv9cuMYbyrWUUEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073427; c=relaxed/simple;
	bh=batdBLni3jQPyrFY8sGiRpU6/bixaDr8eZKCZQId5A4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KTmRszQsKQ31tCh3J42GWvbn4qph/zzRtrrpOGomoAfDyb+heQVeM86urZSAXaJ1llHttOZkiG4YyhHUZzQF2lNQ1bHjk3UAZRLgTeHjOQepibHTRodagscG9ydebp3f2/7Y+ZL5FFGns1pVGKGvLQOvjBgAubeJ7mzh3txbv9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzvf8Tq+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzvf8Tq+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0F9C4CEF1;
	Mon, 21 Jul 2025 04:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073426;
	bh=batdBLni3jQPyrFY8sGiRpU6/bixaDr8eZKCZQId5A4=;
	h=From:To:Cc:Subject:Date:From;
	b=gzvf8Tq+KeTs2mMUv/5zpU51klY3AyjVDFh+Q81bD51uc+EdzgTAQAmAKQD9acpVU
	 NArJNIb3EHxgIyT788SFrit/mYUGVosn8NetqUHkqxaWctCjc1Qp9vny8Tyb8N4TNv
	 vx3OsvZLUgFZEnTcAhsfz6btRyc8k9Yj4KLLXE6veQh7T/jBBNoTlABVyNOIhy6JbZ
	 TzuFbcvIhhapz8ozvkSiBR0134x6Ep2VA8KGOpuYh1cfvTnNf9amP+HUTS4KYf8DtH
	 2ougWB2GQeI5Zs+6NyMnhrp57RyuKBJRZ1KFoQfWKT96qz1h4zSfjpBAk7Bi+ecRhf
	 Kd4Kgzi2yIjKQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	chrome-platform@lists.linux.dev
Subject: [PATCH 0/2] platform/chrome: cros_ec_chardev: To be ec_dev registered-aware
Date: Mon, 21 Jul 2025 04:50:07 +0000
Message-ID: <20250721045009.2737376-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Userland programs may wait forever for MKBP events after the underlying
struct cros_ec_device has been unregistered.  The series tries to return
appropriate errors when detecting such possibilities.

The 1st patch is a clean-up.

The 2nd patch fixes the issue via checking the ec_dev's availability in fops.

The series applies after
"[v3,0/8] platform/chrome: cros_ec_chardev: Fix a possible UAF"
(https://patchwork.kernel.org/project/chrome-platform/cover/20250721044456.2736300-1-tzungbi@kernel.org/).

Tzung-Bi Shih (2):
  platform/chrome: cros_ec_chardev: Don't use wait queue's lock
  platform/chrome: cros_ec_chardev: Check ec_dev's availability in fops

 drivers/platform/chrome/cros_ec_chardev.c | 49 +++++++++++++----------
 1 file changed, 28 insertions(+), 21 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

