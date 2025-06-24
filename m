Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B29372617
	for <chrome-platform@lists.linux.dev>; Tue, 24 Jun 2025 02:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750733924; cv=none; b=uKAk/U1Ty59D1LEt67FjRGnK54HyA97ltWCRgE2Hv1h8ZSj3hMg+HAA0FB7fa4yqO7sAkKdoc1k3BwBzCZ6qacQ92WkVmwcQdlvReSPqRtGfFczBETAOcERcStMFmVDlhKSqRLNzQMjPcXe6HVMhYkBpRq1mvZ/fyTmacDgLfEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750733924; c=relaxed/simple;
	bh=ckE9y9j0j9uTW6rHdzmhUbhKjcBfLO3QDfxv+apNYU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WzUjmJL5tSqJJO82ojEwGNmQg1NVW08z8FUpLgGCdLHyswny21za6kVFI+TUytTF8cTxHfGyZWlXVodCoL9SoSdmYszq6UVHlwvR3o79aZNkFRahzaQrmyA8YtSHAQwg3zGeFCxbfLTYX2VIFeTXunsw76JoATGcJzQcSat1HWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYBnX8VH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYBnX8VH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336F5C4CEEA;
	Tue, 24 Jun 2025 02:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750733923;
	bh=ckE9y9j0j9uTW6rHdzmhUbhKjcBfLO3QDfxv+apNYU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYBnX8VHMub9HdVzxbldzIvBxK2OY9xKWVhK7zfJzSPy48APrR3uEgWbXapRYOH5W
	 Jz8/RtWN4MP/o9Fd7gaPLD7ynpgasqIuoY2Kg6m0+6aBQ0/8ZoJNsDrQXUh56UO3IB
	 UXmLhlyTR6Kv3Be/EdP9ubGZSfdDl3XBpE69FOKZxqegJz5BcsF7UInaJvYo0nAhhZ
	 clbtnghGQ+itpYokra7ua4yrW3lN+guZ8McUCKnqt2OxKKu/tipGtSjLWsDEms2X30
	 NX1CoWhnRH++tAH5dG5HJltjaembwmeNAjaL1kvkygL9HPq7PKiIfiKzN27YUFCIlH
	 1uC09bGSeToTQ==
Date: Tue, 24 Jun 2025 02:58:41 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Gwendal Grignou <gwendal@chromium.org>
Cc: chrome-platform@lists.linux.dev, Gwendal Grignou <gwendal@google.com>
Subject: Re: [PATCH] platform: chromeos: sensorhub: retries when a sensor is
 not ready
Message-ID: <aFoUYVnVwAF-YL-3@google.com>
References: <20250623210518.306740-1-gwendal@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623210518.306740-1-gwendal@google.com>

On Mon, Jun 23, 2025 at 02:05:18PM -0700, Gwendal Grignou wrote:
>  drivers/platform/chrome/cros_ec_sensorhub.c | 23 +++++++++++++++++----

Please take `git log --oneline ...cros_ec_sensorhub.c` as examples for what
patch prefixes it could use next time.
