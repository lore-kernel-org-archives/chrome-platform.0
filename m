Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1334D901;
	Mon, 27 Apr 2026 16:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777308579; cv=none; b=uZr7yWNhJAVWeSa70UH24OwfyXxwiVNtVe7S5O3uUq1sYYK0MU0JNQy4KkJFlOUdrhtMiynPyEn2Fzx96ESadC/gW5v6lVKvV0NQWoY2BqTj1jmEInq9k6xSKa4hc26G02GXSi9Qyzj3OgXCcwfi4AQz5w/rqSZJKo7I9Jm5M6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777308579; c=relaxed/simple;
	bh=ETIbpD7d3EcRqb3IGo8p2oGwy0UQn+B/APpnpBbAdQA=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=UHUIOY5x43wceShENHLxhKzINXShwlKW0FAJirnxqbtcTZGSL/Hv6+ThitI/7xMdhB4yqtvrdKlDIIQHDKCnBuxGKNygJUMuxXmSL/6oQRf0J/H4qWRzrAU/O3gjF35S8RD6Eus4ebBpRpl9LyFvmIRFbBVCqtQ3tBYda0jE9BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LK8CsrJJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LK8CsrJJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D4DC2BCB4;
	Mon, 27 Apr 2026 16:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1777308579;
	bh=ETIbpD7d3EcRqb3IGo8p2oGwy0UQn+B/APpnpBbAdQA=;
	h=Subject:To:Cc:From:Date:From;
	b=LK8CsrJJjA+yO7KUYzpHs62z2jrshsqsMMvJur8SmKiMVZJ05hoZSESj+f991bIcH
	 Vmc6dW2zcXjn4HDqn68pOEFJL1MYNc3tcerddlvDj998UOPJytUMGsY5df1qqOzNbQ
	 yNzGP4umhEDV7vSANKcGullKFzqGbHu0zYOhHYPk=
Subject: Patch "firmware: google: framebuffer: Do not mark framebuffer as busy" has been added to the 6.1-stable tree
To: briannorris@chromium.org,chrome-platform@lists.linux.dev,gregkh@linuxfoundation.org,jwerner@chromium.org,samuel@sholland.org,tzimmermann@suse.de,tzungbi@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 27 Apr 2026 10:48:30 -0600
Message-ID: <2026042730-unrobed-masculine-00e8@gregkh>
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

    firmware: google: framebuffer: Do not mark framebuffer as busy

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     firmware-google-framebuffer-do-not-mark-framebuffer-as-busy.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From f3850d399de3b6142b02315227ef9e772ed0c302 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 17 Feb 2026 16:56:12 +0100
Subject: firmware: google: framebuffer: Do not mark framebuffer as busy

From: Thomas Zimmermann <tzimmermann@suse.de>

commit f3850d399de3b6142b02315227ef9e772ed0c302 upstream.

Remove the flag IORESOURCE_BUSY flag from coreboot's framebuffer
resource. It prevents simpledrm from successfully requesting the
range for its own use; resulting in errors such as

[    2.775430] simple-framebuffer simple-framebuffer.0: [drm] could not acquire memory region [mem 0x80000000-0x80407fff flags 0x80000200]

As with other uses of simple-framebuffer, the simple-framebuffer
device should only declare it's I/O resources, but not actively use
them.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 851b4c14532d ("firmware: coreboot: Add coreboot framebuffer driver")
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Acked-by: Julius Werner <jwerner@chromium.org>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>
Cc: chrome-platform@lists.linux.dev
Cc: <stable@vger.kernel.org> # v4.18+
Link: https://patch.msgid.link/20260217155836.96267-3-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/firmware/google/framebuffer-coreboot.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/firmware/google/framebuffer-coreboot.c
+++ b/drivers/firmware/google/framebuffer-coreboot.c
@@ -50,7 +50,7 @@ static int framebuffer_probe(struct core
 		return -ENODEV;
 
 	memset(&res, 0, sizeof(res));
-	res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+	res.flags = IORESOURCE_MEM;
 	res.name = "Coreboot Framebuffer";
 	res.start = fb->physical_address;
 	length = PAGE_ALIGN(fb->y_resolution * fb->bytes_per_line);


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.1/drm-vc4-platform_get_irq_byname-returns-an-int.patch
queue-6.1/drm-nouveau-fix-u32-overflow-in-pushbuf-reloc-bounds-check.patch
queue-6.1/firmware-google-framebuffer-do-not-mark-framebuffer-as-busy.patch
