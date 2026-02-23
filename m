Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DD61A0BD6;
	Mon, 23 Feb 2026 08:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771834659; cv=none; b=Rz9gmch6UiQIoiHoisSYymxx/WiioND+jcG3isStxFlDpIlvZg/qrP+S2Zzx7OE1E32tdeBLaGZqJPuzcnTxalRCCZXIaFvYZoXPPGweioD64fJTMDjSWVXX79JbfnTZQ3r7dax2eUOTVhn2U5lVgpY5Oq2ZcVh6rpWnCSRUQB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771834659; c=relaxed/simple;
	bh=GJKOBfbDu/SY+Z/JCufO4EKgFgt5vUGg2GhDXEALabM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tcp3i3WeltF3xN04SVX0xfJsO0hg+0S3Hvf30Gs4Gg5AGZdGTSjPuGUjlKQl9LynJceacgay8mnJ+ViccLanKEFg46RPJWc1l5YnElElrRVdh7zCJ4mKgOUsY/+cVuzX6lypAd6uIoN8d2cW4Bb6g50h7fzGBTsSlhRrRB2eV9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwkckhEF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwkckhEF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2952C116C6;
	Mon, 23 Feb 2026 08:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771834658;
	bh=GJKOBfbDu/SY+Z/JCufO4EKgFgt5vUGg2GhDXEALabM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OwkckhEFAulfeApicG0+Uu0izhvz93WluicHT3UXT1IQzonUPXRaPVPs2RRNpBGWm
	 29wcraakejOgfK+K+45cyF74fGlEKddoyUdkwmbfbCagzMtIsV+pJf/p3nd44XU/tG
	 hHksgcRrzKlh6i1hR7Xrhi2BDODRSiKdD6mHiZMuPKdB2vdGOwm+1h4kUagcmdf9tT
	 Jg7VmcLzqq+zGs/eaVnnqYj2v4FqWj/K5K2vHv4aaTsL25K5Q5I29ycAtMXWHOXHkX
	 efgcA6zNxqo8oBA43KaDox4JnJgTYKRqEgfIGRARuitU2kqBH/3h0qOPpM8k6hMwG3
	 LtJdvIusKW5xA==
Date: Mon, 23 Feb 2026 16:17:35 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: trunix-creator <trunixcodes@zohomail.com>
Cc: bleung@chromium.org, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_lightbar: fix const correctness
 of seqname array
Message-ID: <aZwNHxxmwOkNAfcE@tzungbi-laptop>
References: <20260208100049.46449-1-trunixcodes@zohomail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260208100049.46449-1-trunixcodes@zohomail.com>

On Sun, Feb 08, 2026 at 02:00:49AM -0800, trunix-creator wrote:
> The seqname array was declared as 'char const *seqname[]',
> And since the array is intended to be fully immutable, It is now corrected
> to 'const char * const seqname[]' to mark both the strings and the pointer array as read-only.
> 
> This improves const correctness and matches the intended usage of the
> sequence name table.
> 
> Signed-off-by: trunix-creator <trunixcodes@zohomail.com>

Thanks for the patch.

Before this can be considered for merging, you'll need to update the
Signed-off-by line.  The kernel community requires the use of your real
name (legal name) rather than a handle (see also "Developer's Certificate
of Origin" in Documentation/process/submitting-patches.rst).
