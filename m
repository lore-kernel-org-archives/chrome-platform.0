Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D9C2E6CAB;
	Mon, 20 Apr 2026 14:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695920; cv=none; b=s3LYluSgSqOY9l6kf8/jMH7R6HSYxSeaq/+eMIPyWWdeCCLoulikcBbcZVzWH6p9NOzCpg2s5xUg0Ec0D0230969anSu19UXwYpMIzOt/uylHggkPAmbRPdQk+BiULnwX8UXavt7wFhDyXGWuPe55G4LSAc6UsSC70W84vSnDD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695920; c=relaxed/simple;
	bh=Oe2T7ObUXjJmZ3w5vp+0awvdA3ktiKcEhOpqQujoD3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9DOxDUqcTIpkekRSh6GdUTkdyUKGPoga8mx+XwnCSk1aOSlbZmCqgZ7X6ocv7odxEGaOWHpGyFmbPtAK4U5EGnl59r72dQiXeuaOCsmOsbudas8N2c5I7RtLJbSh34qjXQQ46wtfoKcB/R7oEwgucpzfSTXh8mfeB3i/9fmrI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k8IpBWmV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k8IpBWmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC853C19425;
	Mon, 20 Apr 2026 14:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776695920;
	bh=Oe2T7ObUXjJmZ3w5vp+0awvdA3ktiKcEhOpqQujoD3Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k8IpBWmV1xtQ+dsTfuBpAvn22wsPaKdyb8L3o6NDRVEzimyfN1RBGXjOehgpk4QKG
	 DhXPHrfxBm9nXkqJULSSRrwxMLHPKBqSs2yf7QX9TF99Ry1/PnuBx1WfIhoFfgtrmb
	 G7Pcp2qxBn+bG+I+TQfo/Bnj7clzuqZQkmISa2bBVnamMOzwAdP7Mw1VdFVUb+5fNt
	 gzLkWfnXRONhkh37ZWUPs4GfU2J5PCHMV3csrJxG3hHO0Go6EifGumE4lagSHyKlR8
	 C+dQkc2Bh8id3EsbljIVuaY2QTr/37OizBwF/SaYYeFGtHJzPVe8UuXwNW+bsxO16e
	 m/kdojQg0y8aA==
Date: Mon, 20 Apr 2026 15:38:34 +0100
From: Lee Jones <lee@kernel.org>
To: Jameson Thies <jthies@google.com>
Cc: Benson Leung <bleung@google.com>, bleung@chromium.org,
	tzungbi@kernel.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, abhishekpandit@chromium.org,
	akuchynski@chromium.org, ukaszb@chromium.org
Subject: Re: [PATCH v1 1/1] mfd: cros_ec: Don't add cros_ec_ucsi if it is
 defined in OF or ACPI
Message-ID: <20260420143834.GE3202366@google.com>
References: <20260403222253.1888991-1-jthies@google.com>
 <20260403222253.1888991-2-jthies@google.com>
 <adA_-fsV_N1m5i_v@google.com>
 <CAMFSARf+rM-rQvy21DjxTDPFdc0a3-DW_hjEs+Rrtg3nLAqU2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMFSARf+rM-rQvy21DjxTDPFdc0a3-DW_hjEs+Rrtg3nLAqU2A@mail.gmail.com>

On Thu, 16 Apr 2026, Jameson Thies wrote:

> Hey everyone,
> just a friendly ping on this. Mfd maintainers, can you help review this change?

Please refrain from sending out contextless pings

Also, please be aware of the merge-window.  Many maintainers, including
myself, choose to take a breather over this period.

-- 
Lee Jones [李琼斯]
