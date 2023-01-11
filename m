Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5161C17D0
	for <chrome-platform@lists.linux.dev>; Wed, 11 Jan 2023 05:57:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44BDEC433F2;
	Wed, 11 Jan 2023 05:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673416674;
	bh=de0WESFS2rsisXq8QwQ4tzbqzLKAECqzr79yACXqNDM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t0Mi5fdq6Mhui/Kni8OlT3i1sZSW/HZSbWV8GDFGXEsJIbFa1BR/a/WN2Qd7CVmKK
	 7/63vgj/tBySzLyIbyjZccwptxzNyD4gxabU40s2XYmHUjtblK3ZLP2IOvYvb6jU4u
	 myppjUurvqvk01RBzCrDyWbusCmEGxD9DunqvChIZlb+VW3hX9zyMwY4ly4MDTzjTq
	 B2e38pVUFgx3tMspGvoJyp2bDU9oE2NIxmiY1mnM2N+WOIYjcK+c+we8zBpaHmYX8J
	 YEox7S3MNO2bTZJV8AVr+CWvpD5TAFDW2VQzXVlhYKmZmpK7VqQ4xZs4TXtXIFWg3E
	 RXf7zZSJLJqCQ==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: bleung@chromium.org,
	groeck@chromium.org
Cc: chrome-platform@lists.linux.dev,
	tzungbi@kernel.org
Subject: [PATCH 4/4] platform/chrome: fix kernel-doc warnings for cros_ec_command
Date: Wed, 11 Jan 2023 13:57:28 +0800
Message-Id: <20230111055728.708990-5-tzungbi@kernel.org>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
In-Reply-To: <20230111055728.708990-1-tzungbi@kernel.org>
References: <20230111055728.708990-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following kernel-doc warnings:

$ ./scripts/kernel-doc -none \
	include/linux/platform_data/cros_ec_commands.h
include/linux/platform_data/cros_ec_commands.h:1092: warning: expecting
prototype for struct ec_response_get_cmd_version. Prototype was for
struct ec_response_get_cmd_versions instead
include/linux/platform_data/cros_ec_commands.h:5485: warning: This
comment starts with '/**', but isn't a kernel-doc comment.
include/linux/platform_data/cros_ec_commands.h:5496: warning: This
comment starts with '/**', but isn't a kernel-doc comment.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
 include/linux/platform_data/cros_ec_commands.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
index 6665e7da6ee2..b9c4a3964247 100644
--- a/include/linux/platform_data/cros_ec_commands.h
+++ b/include/linux/platform_data/cros_ec_commands.h
@@ -1082,7 +1082,7 @@ struct ec_params_get_cmd_versions_v1 {
 } __ec_align2;
 
 /**
- * struct ec_response_get_cmd_version - Response to the get command versions.
+ * struct ec_response_get_cmd_versions - Response to the get command versions.
  * @version_mask: Mask of supported versions; use EC_VER_MASK() to compare with
  *                a desired version.
  */
@@ -5480,7 +5480,7 @@ struct ec_response_rollback_info {
 /* Issue AP reset */
 #define EC_CMD_AP_RESET 0x0125
 
-/**
+/*
  * Get the number of peripheral charge ports
  */
 #define EC_CMD_PCHG_COUNT 0x0134
@@ -5491,7 +5491,7 @@ struct ec_response_pchg_count {
 	uint8_t port_count;
 } __ec_align1;
 
-/**
+/*
  * Get the status of a peripheral charge port
  */
 #define EC_CMD_PCHG 0x0135
-- 
2.39.0.314.g84b9a713c41-goog

