Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C21E292B25
	for <chrome-platform@lists.linux.dev>; Thu,  3 Jul 2025 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751542521; cv=none; b=YMkyMTbXKCkCzk9qajG1bLzM2dbPiVzTVQKP2qJe2jHNK2zt9MaQgJLRBSuMWESG9RrU8zeRIvanNBb/sVcDE3IG2cy33AFBeuqJBMfrq0jueuBsBE/bwM5bQBBZOljJFLnWIuJCCUGqC2BxWG0FFLR+rUNAJr01npuZsLRnAXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751542521; c=relaxed/simple;
	bh=zI615E1vP8CAwPN95DKNzFoCST/KmAT/MbEI9rdP3iU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwuVgNXHbWhZbdoxwQqr7SBMxpPezqE6iPFFfTSSQO2nJcekbC/OGE16f1MQiD7z0MN1nw4r4+Y6xoQsG3QTYWq4FeC7VKP+GUu33ETDTytqIKa7JdG8lAa84E/egzqT+pqpA6jFf676+zurELU5kKQjJuNO/d+yM8WClPq7f7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uegPHU48; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uegPHU48"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FE3C4CEF1;
	Thu,  3 Jul 2025 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751542520;
	bh=zI615E1vP8CAwPN95DKNzFoCST/KmAT/MbEI9rdP3iU=;
	h=From:To:Cc:Subject:Date:From;
	b=uegPHU48PlksSZqCnyG3qPwqk5Kk/pSmPgOS/xO9kyHsvvzzQgJbKxNxorfd6snE9
	 br/pjK+ts+eWVOlqA0zrFRGWPkveLjTqgv6nJHacZuiTD96tFlLF+an0H6nZnFfku1
	 t8WvVdQaQQ1xMyjG3VbmTV3FjeUUUNV6v0hGJAp9Aora3JkMqj0Xu+gLI7R/UgKVop
	 YpnNJWlusvfsul4xDWbWZ2KveLfhpoEF6ieUz2qXLA95OpMzXmFhez3AKzB5UZm9rS
	 wqz4CJfXIXEn7I6DO7p4UHMbzrPgsc16fyN5/4cq/ttoM1MEMpi5QKX8rbRqN+5mKL
	 sVMKQOlS1i6Ow==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org,
	dawidn@google.com
Subject: [PATCH 0/2] platform/chrome: cros_ec_chardev: Fix a possible UAF
Date: Thu,  3 Jul 2025 11:35:07 +0000
Message-ID: <20250703113509.2511758-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 1st patch is a cleanup.

The 2nd patch fixes the UAF via setting `ec_dev` to NULL to prevent the misc
device from accessing the obsolete `ec_dev`.

Tzung-Bi Shih (2):
  platform/chrome: cros_ec_chardev: Remove redundant struct field
  platform/chrome: cros_ec_chardev: Fix UAF of ec_dev

 drivers/platform/chrome/cros_ec_chardev.c | 91 ++++++++++++++++-------
 1 file changed, 66 insertions(+), 25 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

