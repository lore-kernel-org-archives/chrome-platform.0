Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825B128396
	for <chrome-platform@lists.linux.dev>; Fri, 24 May 2024 08:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716540109; cv=none; b=QL/t980G+UOGH7AFdFS36f8kIcxt4gy6RbOubFFMygQhyQFxi+6Ame/7SHUIOiMSiLFNeiJexSq39GKDiSM1h+QLksqNX9TplyMOmxX1fbFk3M1JjC97VCg71m8r+4eI5bmhlb9tnSswBqKU9ttqKohdeR9GhqQYwVPtBrIMF74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716540109; c=relaxed/simple;
	bh=5TOBwxsF/ssAhWevLOKVZZiad/EoE9Qjo1wELgR4coQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPA/srS5eUJ7uEr4hC2QZ2xHoVXsU1LdCkg41SkJgLwdFtNsy3Vr1+GH+MScLNsJknErQ50ILGfDh1gMmIdRvtSyksH52xElxr2NLCK0Kv2n+/0Qh0LA3SXBQ2NMoUOSAxzmrLqtCELDKvQgvdNzZLMpDYbwjPpug2+XrWVBcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LcNB+fVr; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LcNB+fVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1716539617;
	bh=5TOBwxsF/ssAhWevLOKVZZiad/EoE9Qjo1wELgR4coQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LcNB+fVrAstclMmo+s7OkLnZov3T5v4uYCIGxidfSmxDkoE9blWvLpDN3QXIlqulb
	 rNQQHloLLqm656kkw7QiCXRmNTHqniWpFwIgDey1wBsg19m/ehmt4i8UwLALQBvJ3x
	 3vNVuKCBoEFwtgQ6DeG4k5QDpqd2xJ/W4FrtDtGM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 24 May 2024 10:33:34 +0200
Subject: [PATCH 2/2] platform/chrome: cros_ec_proto: Fix
 cros_ec_get_host_command_version_mask kdoc
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240524-cros_ec-cmd_versions-v1-2-8a148647d051@weissschuh.net>
References: <20240524-cros_ec-cmd_versions-v1-0-8a148647d051@weissschuh.net>
In-Reply-To: <20240524-cros_ec-cmd_versions-v1-0-8a148647d051@weissschuh.net>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716539616; l=907;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5TOBwxsF/ssAhWevLOKVZZiad/EoE9Qjo1wELgR4coQ=;
 b=5JvEnK5PvixO13QAhdFeynqVs1V2NjccBnydXRn0155oulCmimDplO7i0ZdvDH3u0pQINFLVq
 y/6ffRXurkdBh8vFcjK1GY7k41WdcqJnZz55YMTZNybAkyhU/C+zBMQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Mark the documentation block as kernel doc and drop the documentation of
the non-existing parameter "@msg".

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/chrome/cros_ec_proto.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_proto.c b/drivers/platform/chrome/cros_ec_proto.c
index 0006a3439644..dcfc18fe1cdf 100644
--- a/drivers/platform/chrome/cros_ec_proto.c
+++ b/drivers/platform/chrome/cros_ec_proto.c
@@ -426,13 +426,12 @@ static int cros_ec_get_proto_info_legacy(struct cros_ec_device *ec_dev)
 	return ret;
 }
 
-/*
+/**
  * cros_ec_get_host_command_version_mask
  *
  * Get the version mask of a given command.
  *
  * @ec_dev: EC device to call
- * @msg: message structure to use
  * @cmd: command to get the version of.
  * @mask: result when function returns 0.
  *

-- 
2.45.1

