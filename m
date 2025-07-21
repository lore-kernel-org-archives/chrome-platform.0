Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319A972637
	for <chrome-platform@lists.linux.dev>; Mon, 21 Jul 2025 04:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753073122; cv=none; b=TnM+G4i8TAmxl+eoirI99eAeWRGs7wNiubZ4qYz6hic2rHvprVcOZjg6Met2VOckF4MdakfAEzjVzxJ01lzWryCYSsQdZSA2Uem3RoylQ5UUPON4n+X9v9MvGIx1gByOcPxI6NkxmQv0SSF7ZSr2q68vw+iS1f5HY5cNoZq027k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753073122; c=relaxed/simple;
	bh=CE0Z453NGqK270jTXKPcrWdvuNnXsO4XZDXwb5QFzLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fswGDwpCHyxkCnTBrUc6IzLAvBIZ45t972pJ2Vv3zdzOVPniFfEJahS7CoHaSMgKLSraPrKcdSqhUY37lY/jkozWT1hf8wGZaQ21Bw6y8VKwJjJFI0NfZW9KBJHHkLEsQ7x/5dFwWAMbV5xFPXMt/V8q3zWoZXjiGVPvVch13FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbDKWHYj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbDKWHYj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3D9C4CEF4;
	Mon, 21 Jul 2025 04:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753073122;
	bh=CE0Z453NGqK270jTXKPcrWdvuNnXsO4XZDXwb5QFzLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GbDKWHYjKpDyy4F34WoDGBCe7wjbvx27VpXsyxp/mbSa0+z9+EwTRjLFZEilweO/9
	 hwc0yHy3o1RVRF4OFECtwLdShZt425N2Qwr4sv66nJz82T0LWUe9uvAiKppC9Uxpuw
	 NmPNfZKwqZ8upJ/h+wn0CAYefczl0o6Ya3lN4R+CucNiu8e4Q5RTg1Ssf1xQ9xXG8A
	 aiNtu6w8Qs/rcTM3VOapzScmN8+wzg2IwTnohKoMPH5JKg5EEiP99mSl0RYHHDS5Aa
	 5KNMMx2RNFYmMI9x7VD06f2dup9IW2FeMNvNWqLPmi62qry806kuJzI+I4Ie5H8C3C
	 JKzNvy6JRnmgg==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org
Cc: tzungbi@kernel.org,
	dawidn@google.com,
	gregkh@linuxfoundation.org,
	chrome-platform@lists.linux.dev
Subject: [PATCH v3 2/8] platform/chrome: cros_ec: Unregister notifier in cros_ec_unregister()
Date: Mon, 21 Jul 2025 04:44:50 +0000
Message-ID: <20250721044456.2736300-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250721044456.2736300-1-tzungbi@kernel.org>
References: <20250721044456.2736300-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocking notifier is registered in cros_ec_register(); however, it
isn't unregistered in cros_ec_unregister().

Fix it.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
New patch in the v3 series.

 drivers/platform/chrome/cros_ec.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec.c b/drivers/platform/chrome/cros_ec.c
index 110771a8645e..fd58781a2fb7 100644
--- a/drivers/platform/chrome/cros_ec.c
+++ b/drivers/platform/chrome/cros_ec.c
@@ -318,6 +318,9 @@ EXPORT_SYMBOL(cros_ec_register);
  */
 void cros_ec_unregister(struct cros_ec_device *ec_dev)
 {
+	if (ec_dev->mkbp_event_supported)
+		blocking_notifier_chain_unregister(&ec_dev->event_notifier,
+						   &ec_dev->notifier_ready);
 	platform_device_unregister(ec_dev->pd);
 	platform_device_unregister(ec_dev->ec);
 	mutex_destroy(&ec_dev->lock);
-- 
2.50.0.727.gbf7dc18ff4-goog

