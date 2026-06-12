Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA4E3E7173
	for <chrome-platform@lists.linux.dev>; Fri, 12 Jun 2026 12:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268705; cv=none; b=tovxWl1O1qrbajCJfsqpr2NQDkzAYpeBnIC3LJq7MJ9dbkEWX6J6MtLUIUdRtWybW3SwjTUw0vKgkRn7knMzyYemsuy3XUhTpxQRJ5NQDIpOOO4Qja08fbCtVKQ+nPl0aFf6xmsc5JpMQX5kqVQaMP1YYsIhiykjguo57NSKz8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268705; c=relaxed/simple;
	bh=HD0KglOaapnPFNl6xAFn4EC0PydFCGPzCu6AtaoIelU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sEIncDagHEri+Dfdpgo1qqqVRq23tqOVbU6yHsnVyjQaR0BPqz9xJLnFF88+BN1pLl6ADqahBLNMUG8zgOxgxJhwmF7m3vH89A+M29TlmaBUMBtGD4c7iHVcn/V3jsIxv3md4Gfu1W+HLvPctR4dSAxzPWOZJAS1bSLMgJXEmZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uQCklQva; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xroWfx1F; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uQCklQva";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xroWfx1F"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gcKCG3DFyz9tgl;
	Fri, 12 Jun 2026 14:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781268698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B9r+RyUa7CXOpevgqedTIVlaSZeLXRwts+ei0YcXF9Q=;
	b=uQCklQva58oYXcKlnndNGwbREoxoC6+qZVBfIcf498Xj2G5bx/2VbQ9x/NKtHfnzO52qdL
	0cJlpBFQYI4mw6u4VWslDyAhHv1R/IqlciIXdwODF0NosKhbDV3EzQICvqM+6qG09NLVFP
	jz2u8czZsBv2YazFOr+VnfA6nebJKEdR1X/RynvPIjnBAzPlr5YHBzFkmWvNjS38P8UuI1
	tfls9jnA5+um2w33BBqjOfQ5InvENvxOCYactwXRbDd6hw7J2PaLEGlBUP3gjEvznh6E5i
	nLxS307/+X7Z9iuiQBqXOhQx5G08s6SHLp8Yiw1pjJ/xjFzajCqkk85zONlv/A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=xroWfx1F;
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781268696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B9r+RyUa7CXOpevgqedTIVlaSZeLXRwts+ei0YcXF9Q=;
	b=xroWfx1FOjvfXkoNqe9WBLRDQFRz+TnEpoWt5FdhGyfxvmhH29qCHuGnqH3Rh6usHAgYOD
	X2vRBzfMfaSv0BjR2NWpjVvFjstbLsVdT2w//ZG6JP/DFOWzZ1ZyTW8ujopri9Y44UA38p
	ikSfXfh8YqAg5CC9luUjmBSbRhOkHctcNCNGxi+P1qiMlKPpBWW73s84hYLaopi/+A6IL0
	xIpnhfXTZnWOyy9tjYNPSdSxra8HOdMP12SDff/wk9/DCOoV3HlC2NVLk9veSktwki1Zlu
	DAp9j+G+q1cBQmCS7uQvVdM0XvWd+qjNvHn99yTOKi68HjNC1124lNbmk9unqQ==
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev
Cc: Manuel Ebner <manuelebner@mailbox.org>
Subject: [PATCH] docs: ABI: testing: minor cleanup
Date: Fri, 12 Jun 2026 14:51:12 +0200
Message-ID: <20260612125111.187072-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 9ieo4u58a6ciqhhskebokzo3wxexz9ef
X-MBO-RS-ID: 03ddfe4f4d9095c11a1
X-Rspamd-Queue-Id: 4gcKCG3DFyz9tgl

Add missing ')'.

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/ABI/testing/sysfs-firmware-gsmi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-firmware-gsmi b/Documentation/ABI/testing/sysfs-firmware-gsmi
index 7a558354c1ee..3b3c3ae6f458 100644
--- a/Documentation/ABI/testing/sysfs-firmware-gsmi
+++ b/Documentation/ABI/testing/sysfs-firmware-gsmi
@@ -19,7 +19,7 @@ Description:
 		/sys/firmware/gsmi/vars:
 
 			This directory has the same layout (and
-			underlying implementation as /sys/firmware/efi/vars.
+			underlying implementation) as /sys/firmware/efi/vars.
 			See `Documentation/ABI/*/sysfs-firmware-efi-vars`
 			for more information on how to interact with
 			this structure.
-- 
2.54.0

