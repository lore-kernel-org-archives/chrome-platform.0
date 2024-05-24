Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B9128376
	for <chrome-platform@lists.linux.dev>; Fri, 24 May 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716540109; cv=none; b=FUWd4oLDdhDKL4c1L20ROimnm7FdiMpWIQjumr2Hftybq1YOW9YE+arhUTMd6m4uPha1bQybr8zPwoDlP8tL1BtfqCacwKE5/59MEZFNG1VGA74lpULVuBdT8iPm6hgMr1dVwcw/ij8yuX0FFdNqdqE+/nZyE0w1bfM5BxqOOao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716540109; c=relaxed/simple;
	bh=jW7Ftx2KC1dZBw3RvLRdW6NdGdVgwOqgZIoRTzVqnw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YYzusN+Pvni8kdNRRBST7qMOPLLSs+ymdfTISv8urt7xTmZs3GwQ7SJ1czqXjdsu9K7O2azpinpHjp0qlzm220cEdZ+v51z8JZLxKtkB0/Fsg5kkDEx6Io/G/kKZA+z7PYJn1WVRrXuwg3rHDaMQjdzU5qEY9D4RP9dbd4ETYLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=K6PK2L8l; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="K6PK2L8l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716539617;
	bh=jW7Ftx2KC1dZBw3RvLRdW6NdGdVgwOqgZIoRTzVqnw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K6PK2L8lKKciR/X/Z2zY3yWFXQw6PvLlk16PKu8opADJm4VQ4GH/hG/0LOZ/pO/84
	 a+xHxDuzqAQaOKy1RA41lMSS5lFN8ADdBabV0TveJnLQ2asM9PJs7LJ1arvUa1Pzo2
	 NRkSv2hqlAOfB/ZunmTS5UZ1XA0FywWoq0a3TFmA=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 24 May 2024 10:33:33 +0200
Subject: [PATCH 1/2] platform/chrome: cros_ec_proto: Fix
 cros_ec_get_host_event_wake_mask kdoc
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240524-cros_ec-cmd_versions-v1-1-8a148647d051@weissschuh.net>
References: <20240524-cros_ec-cmd_versions-v1-0-8a148647d051@weissschuh.net>
In-Reply-To: <20240524-cros_ec-cmd_versions-v1-0-8a148647d051@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716539616; l=899;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=jW7Ftx2KC1dZBw3RvLRdW6NdGdVgwOqgZIoRTzVqnw8=;
 b=tdDZmBqCcfDDvYZ/RXnm+5CGEpxY3ZccSVnb4kk8oI1wWqrTcdwwRQuwaLfHsPkokYnGfEG8e
 qUXQ1wkOAXvDbhT0OrPeEjIViW+OH7q82Ah71gsL6uVz5Fe4X4bS52k
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Mark the documentation block as kernel doc and drop the documentation of
the non-existing parameter "@msg".

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/cros_ec_proto.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 945b1b15a04c..0006a3439644 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -239,13 +239,12 @@ int cros_ec_check_result(struct cros_ec_device *ec_dev,
 }
 EXPORT_SYMBOL(cros_ec_check_result);
 
-/*
+/**
  * cros_ec_get_host_event_wake_mask
  *
  * Get the mask of host events that cause wake from suspend.
  *
  * @ec_dev: EC device to call
- * @msg: message structure to use
  * @mask: result when function returns 0.
  *
  * LOCKING:

-- 
2.45.1

