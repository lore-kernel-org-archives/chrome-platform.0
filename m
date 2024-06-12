Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034C918622;
	Wed, 12 Jun 2024 15:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718206239; cv=none; b=XbXVztnpdenxjNOT9pupUTzc4rOT/xd9Hv1R7HFwxpVUFlrYZzPrvmUonAiKX5hKi5TR85s308eyyWQ/whJbszTv8fcQ/XkmSutgEJWIbGnuPJuapbMcHAkfBv3g7w6NsCZv/aC4cJpx53kd1DqfztQtz5EkWrorlCnyc+szOKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718206239; c=relaxed/simple;
	bh=Jy6MXyyD7pK0pfXNAu0/4Jvn9VfEeO9G1C2eFiNCvfY=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=nQNVFrybeH0rp0gsUINEHepzequkOMrwtiMsXYkB7cfCCymbPUhWLfT5+oGpDq9eZYjQVKafDHlQEpKyGd7GI0lEjdfcZ9RvDtaVnhReuT3E0+Fa0/0vrIVo1ADWrEvf0DLlyLnx8yf3tXtvxrQugOouNi1JoNq2Q/9RtkAp7dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wAtl1pOO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wAtl1pOO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 806ACC116B1;
	Wed, 12 Jun 2024 15:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718206238;
	bh=Jy6MXyyD7pK0pfXNAu0/4Jvn9VfEeO9G1C2eFiNCvfY=;
	h=Subject:To:Cc:From:Date:From;
	b=wAtl1pOOye7/6TGHb9yWIQN+Tk8RqsjBWHGO65pRXVahTHcJRx3h//Z4GgUGB+XrH
	 umxW1fhDgej8g92H58moc7i3qom6p7GKVJQ2H+rhnryrsgQFKSKGx0sfFgO0hKsYha
	 uKByiwTBid2uLsbfgrtnvbjwuE610NwwpmnJ4DQE=
Subject: Patch "platform/chrome: cros_ec: Handle events during suspend after resume completion" has been added to the 6.6-stable tree
To: chrome-platform@lists.linux.dev,gregkh@linuxfoundation.org,kramasub@chromium.org,lalithkraj@chromium.org,tzungbi@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 12 Jun 2024 17:29:36 +0200
Message-ID: <2024061236-silica-carnation-e507@gregkh>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    platform/chrome: cros_ec: Handle events during suspend after resume completion

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     platform-chrome-cros_ec-handle-events-during-suspend-after-resume-completion.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 2fbe479c0024e1c6b992184a799055e19932aa48 Mon Sep 17 00:00:00 2001
From: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Date: Mon, 29 Apr 2024 12:13:45 -0600
Subject: platform/chrome: cros_ec: Handle events during suspend after resume completion

From: Karthikeyan Ramasubramanian <kramasub@chromium.org>

commit 2fbe479c0024e1c6b992184a799055e19932aa48 upstream.

Commit 47ea0ddb1f56 ("platform/chrome: cros_ec_lpc: Separate host
command and irq disable") re-ordered the resume sequence. Before that
change, cros_ec resume sequence is:
1) Enable IRQ
2) Send resume event
3) Handle events during suspend

After commit 47ea0ddb1f56 ("platform/chrome: cros_ec_lpc: Separate host
command and irq disable"), cros_ec resume sequence is:
1) Enable IRQ
2) Handle events during suspend
3) Send resume event.

This re-ordering leads to delayed handling of any events queued between
items 2) and 3) with the updated sequence. Also in certain platforms, EC
skips triggering interrupt for certain events eg. mkbp events until the
resume event is received. Such events are stuck in the host event queue
indefinitely. This change puts back the original order to avoid any
delay in handling the pending events.

Fixes: 47ea0ddb1f56 ("platform/chrome: cros_ec_lpc: Separate host command and irq disable")
Cc: <stable@vger.kernel.org>
Cc: Lalith Rajendran <lalithkraj@chromium.org>
Cc: <chrome-platform@lists.linux.dev>
Signed-off-by: Karthikeyan Ramasubramanian <kramasub@chromium.org>
Link: https://lore.kernel.org/r/20240429121343.v2.1.If2e0cef959f1f6df9f4d1ab53a97c54aa54208af@changeid
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/platform/chrome/cros_ec.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -432,6 +432,12 @@ static void cros_ec_send_resume_event(st
 void cros_ec_resume_complete(struct cros_ec_device *ec_dev)
 {
 	cros_ec_send_resume_event(ec_dev);
+
+	/*
+	 * Let the mfd devices know about events that occur during
+	 * suspend. This way the clients know what to do with them.
+	 */
+	cros_ec_report_events_during_suspend(ec_dev);
 }
 EXPORT_SYMBOL(cros_ec_resume_complete);
 
@@ -442,12 +448,6 @@ static void cros_ec_enable_irq(struct cr
 
 	if (ec_dev->wake_enabled)
 		disable_irq_wake(ec_dev->irq);
-
-	/*
-	 * Let the mfd devices know about events that occur during
-	 * suspend. This way the clients know what to do with them.
-	 */
-	cros_ec_report_events_during_suspend(ec_dev);
 }
 
 /**
@@ -475,8 +475,8 @@ EXPORT_SYMBOL(cros_ec_resume_early);
  */
 int cros_ec_resume(struct cros_ec_device *ec_dev)
 {
-	cros_ec_enable_irq(ec_dev);
-	cros_ec_send_resume_event(ec_dev);
+	cros_ec_resume_early(ec_dev);
+	cros_ec_resume_complete(ec_dev);
 	return 0;
 }
 EXPORT_SYMBOL(cros_ec_resume);


Patches currently in stable-queue which might be from kramasub@chromium.org are

queue-6.6/platform-chrome-cros_ec-handle-events-during-suspend-after-resume-completion.patch
