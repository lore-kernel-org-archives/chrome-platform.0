Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC6D6F2F2
	for <chrome-platform@lists.linux.dev>; Fri,  6 Feb 2026 05:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770354829; cv=none; b=t0uwWPhWOChMEdZwR4tXZvlw/7Vf53N1DRWvI4kK9PwgV0O5nK3BDbRuhcnDdxK94QLM0AFioKwQvaNTXzbzJuHK8lZ8bCCcAi73b81y+mRYhspJZn4PGohh9MMW0h6w6Dv3X2JfHmfOtyPDzzZKPhS6YgAaoHFwI8XFumzDYxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770354829; c=relaxed/simple;
	bh=SELwI8x2fY2Mg/K9mrj2wjwWIxG7k5ARqUF6zfTyb/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvdewP2885JbZlds0Txr+W39Nykz3Uy3s1ANh3pn2FHytdPuBLrvage4u1inPU4k8IZAufT1sa53WKskTRAztZBjqIX32sEYYZl4HQ7MZNOylNnW+hZ9EDYoL3J8AR8+/aLGOkEABERSJFbdtYEqseU/xjZikRZoUcbspJD0E0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MEOSBYez; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MEOSBYez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDAC3C116C6;
	Fri,  6 Feb 2026 05:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770354828;
	bh=SELwI8x2fY2Mg/K9mrj2wjwWIxG7k5ARqUF6zfTyb/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MEOSBYezow6B4qu+aSRo44cthqiqEA3BlG3oZII+FnHbJlYPtj7Fx9XoNAvblLY7H
	 FUxtbdhptk62hXOIOfCXtfLKokYj4726nXEHc46xK5vtLlC5XgBiIRWodDd20QFxam
	 5GT5bfq+iwKi38wJw/pquV1S+b0MoWXKMDSYhgm1D3ZqOKMGILDzlZlxdEzCBLeyKl
	 S4ndUVXN3i2Jrco/ecJuuvjb+DYl220QhLkTW6Od0OLnpeP5NXIMQoBXxydol7uews
	 YDRQMOx1OxDaxvJ8MhNPafURvKkJGsEOp63IPh51Zaa0sM5b1CrlyL/3lINxt8xD4k
	 VE1Ivt/Jd1PSQ==
Date: Fri, 6 Feb 2026 05:13:44 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: briannorris@chromium.org, jwerner@chromium.org, javierm@redhat.com,
	samuel@sholland.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
	chrome-platform@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 09/12] firmware: google: Pack structures for coreboot
 table entries
Message-ID: <aYV4iOKmZgJc0hdb@google.com>
References: <20260203135519.417931-1-tzimmermann@suse.de>
 <20260203135519.417931-10-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203135519.417931-10-tzimmermann@suse.de>

On Tue, Feb 03, 2026 at 02:52:28PM +0100, Thomas Zimmermann wrote:
> Pack the fields in the coreboot table entries. These entries are part of
> the coreboot ABI, so they don't follow regular calling conventions. Fields
> of type u64 are aligned to boundaries of 4 bytes instead of 8. [1]
> 
> So far this has not been a problem. In the future, padding bytes should
> be added where explicit alignment is required.
> 
> v2:
> - use aligned 64-bit type instead of __packed__ attribute (Julius)

Changelog should be after "---" otherwise it becomes part of commit message.

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://github.com/coreboot/coreboot/blob/main/payloads/libpayload/include/coreboot_tables.h#L96 # [1]
> Suggested-by: Julius Werner <jwerner@chromium.org>
> Acked-by: Julius Werner <jwerner@chromium.org>

Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
