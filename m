Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4E0C8D7
	for <chrome-platform@lists.linux.dev>; Tue, 30 Apr 2024 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714442977; cv=none; b=r7VhGqlrpH+xgiGWkhrwcExXk1HNFbBhv1VSCZPpLfeNGnoel04/No4E0l0dQV09J+6R3myeOVXKWZjRIFPfO+O87s5VGQSd4HZRMjIQJE1L7InwKyWbKtx06PjQjnLruqfG3EhMR1+xUTUTURbW6QNSg9ZLPnrlmW9wa5SjLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714442977; c=relaxed/simple;
	bh=7GqHcZi67lO1xiDm6hNHeT2KHlyJC95zW0wGY0skYA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VC1IJyJRi34ZuG3/MQwUde3OHWt0yWdFSNFHNhenFNUfVox41+yARI4PUhoULUG+Ao4Myeg901u3jq5K6YLn46Z37NIu8c/FTsucrrKE8QuNhrtkOmssadvzozwpB7WkOlqh5anfYCWe/zUIu6cpV7qtDxzEtcbaT3goDglP0gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cVJlXXqo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cVJlXXqo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C94AC116B1;
	Tue, 30 Apr 2024 02:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714442977;
	bh=7GqHcZi67lO1xiDm6hNHeT2KHlyJC95zW0wGY0skYA8=;
	h=From:To:Cc:Subject:Date:From;
	b=cVJlXXqoaOwGIsIhebofOVA1cF2izaR5iX85iVM/RhepzzQDf9AHQHUeA5l8M+rRK
	 MRursdRjlkBvcL585ETxPtJD8w7aJIyKzrWNZHJhvzAIAGL3QItb3h3jYnkbhLtugy
	 nkUfoX4+aHdrjHVZVdsHIv529l6eCZkCeO/tws3zSnm3sB64DRw8CNhHNTkWQAZfdv
	 bAbo0zboIfcmBwYTlU2d7++OQBTk7oEBkd3mztnYtaB1QM9UbaLuA37PXxSk3Bx1h9
	 7inuW5QGkVHSQuGQXL5AJnpkOxIgL5WSw3TFZOZfVwkxGgv9eWY8lnhAX1G4WlUKBI
	 tALUi6/D3Nxdg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: tzungbi@kernel.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH] platform/chrome: cros_ec: let cros_ec_suspend() call cros_ec_suspend_*
Date: Tue, 30 Apr 2024 10:09:24 +0800
Message-ID: <20240430020924.610724-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After commit 2fbe479c0024 ("platform/chrome: cros_ec: Handle events
during suspend after resume completion"), cros_ec_resume() starts to
call cros_ec_resume_early() and cros_ec_resume_complete().

To be neat, let cros_ec_suspend() call cros_ec_suspend_prepare() and
cros_ec_suspend_late().

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 drivers/platform/chrome/cros_ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 47d19f7e295a..e821b3d39590 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -388,8 +388,8 @@ EXPORT_SYMBOL(cros_ec_suspend_late);
  */
 int cros_ec_suspend(struct cros_ec_device *ec_dev)
 {
-	cros_ec_send_suspend_event(ec_dev);
-	cros_ec_disable_irq(ec_dev);
+	cros_ec_suspend_prepare(ec_dev);
+	cros_ec_suspend_late(ec_dev);
 	return 0;
 }
 EXPORT_SYMBOL(cros_ec_suspend);
-- 
2.44.0.769.g3c40516874-goog

