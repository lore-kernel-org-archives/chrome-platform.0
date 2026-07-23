Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAA367B99;
	Thu, 23 Jul 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822596; cv=none; b=Xx1FGwkMPYX1eb2E0VVo661DGBc9f0MvBzWSyiNYu2nq9OFzwMWwaMXhUUwd8Kw6f6Rkel3pWIK9xtOVxwNYOLdAfH8Ik3m0/6hhMb+ph8C0PXdTpEvfH9+7wZRp+iryZ4hEQOguRuEROPm7C1zRiNUoLZhtleSdzCV6eu6Zz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822596; c=relaxed/simple;
	bh=WcHcgheBnaCGSC3EQDptUBz9EWdx0vcPZ6CQFStEn00=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s+5fsZ+v1E9y2q/e8XvwYMNzcttLqggSWAvrlHOOBP6/jcz1u70piZnpquTxHTM6FIcv/cGxpFIVUPXa4i039Kurfcwj7WyvU0c5gv8H2qE4C/YeFA/7ijYdJm/sMSmaC+xadhYZ5vhB6z5VUL9LTmR0Y6CMqXPBRJw0JZ1HRG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719591F000E9;
	Thu, 23 Jul 2026 16:03:13 +0000 (UTC)
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>, 
 Andrei Kuchynski <akuchynski@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, 
 Gwendal Grignou <gwendal@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260608211518.2214740-1-akuchynski@chromium.org>
References: <20260608211518.2214740-1-akuchynski@chromium.org>
Subject: Re: [PATCH v2 0/2] mfd: platform/chrome: Catch EC feature read
 errors during probe
Message-Id: <178482259319.3530477.8287706988972276877.b4-ty@b4>
Date: Thu, 23 Jul 2026 17:03:13 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 08 Jun 2026 21:15:16 +0000, Andrei Kuchynski wrote:
> This series fixes a sysfs duplicate name collision that occurs when the
> Fingerprint device fails to respond during probe, causing it to
> incorrectly fall back to the generic 'cros_ec' name.
> 
> Changes in v2:
> - Split into a 2-patch series.
> - Carried over Acked-by from Tzung-Bi Shih for Patch 1.
> - Fixed an ec->class_dev resource leak by utilizing 'goto failed;'.
> - Moved class_dev initialization to prevent a missing release()
>   callback warning on the error path.
> 
> [...]

Applied, thanks!

[1/2] platform/chrome: cros_ec_proto: Introduce cros_ec_read_features helper
      commit: d6ae9f9b9bd373461442f17ef157ed9ee850a413
[2/2] mfd: cros_ec: Read EC features during probe to catch transfer error
      commit: 5855464dff6a2171847463775c7cdac92742e0f9

--
Lee Jones [李琼斯]

