# Red Hat / CentOS kernel shim signatures

This git repository contains shim signatures (SHA-256) for all released RHEL
and CentOS versions.

## Description

Due to hardening within the Red Hat Enterprise Linux 8 kernel, which was
released as part of the
[CVE-2020-10713](https://access.redhat.com/security/cve/CVE-2020-10713) update,
previous Red Hat Enterprise Linux 8 kernel versions have not been added to
shim’s allow list. If you are running with Secure Boot enabled, and the user
needs to boot to an older kernel version, its hash must be manually enrolled
into the trust list. This is achieved by executing the following commands:

    # pesign -P -h -i /boot/vmlinuz-<version>
    # mokutil --import-hash <hash value returned from pesign>
    # reboot

This can be problem when PXE or UEFI HTTP booting older kickstart trees via
grub2 bootloader which comes from newer version of RHEL or CentOS, for example
when using Foreman, Katello, Orachino or Red Hat Satellite.

## Hashes

    CentOS-8.0.1905 386dd5097c3306c8d55a173b5809b5dc7440d973762d69d59c9698b06449513a
    CentOS-8.1.1911 bc0db22f53087fa6bb8942c64025982b5f45ccc48c103e3129dc5e3733813dbc
    CentOS-8.2.2004 b47cb381a72c9e9869eabf72c441a756826b0ed92f21cc96fb8bb04e03afcbfc
    CentOS-8.3.2011 fa253dba9f1730eddd7c94920b58b37a4074f02fd0ccd2925283d43b31e36f88
    RHEL-8.0 86dac494f0dfd04952c0220077290d272c54f55bd400a7b55dac941a8ff603eb
    RHEL-8.1 b5beb61c84ec7bfa4465867a9ebc48e5b72280d2ddc435c460712d48ed03c68b
    RHEL-8.2 8e133b30561b738a0cbb242d597ebd42f7c8c70987f0e1e9ef2ca3f4f6cc09db
    RHEL-8.3 b5145d7c4e8cd9a53b47ca173fc7d9ce67a7e65c59e78f47c93efefcfe1cfd97

## Example

To import CentOS 8.0 kernel signature to a target host (a server that needs to
be provisioned), boot it in SecureBoot EFI mode and do:

    mokutil --import-hash 386dd5097c3306c8d55a173b5809b5dc7440d973762d69d59c9698b06449513a

## Symptoms

An error occurs during RHEL 8 or CentOS 8 procedure:

    error: /vmlinuz-X.Y.Z-AAA.B.C.el8.x86_64 has invalid signature.
    error: you need to load the kernel first
    Press any key to continue...

## Version not listed here

Use shell scripts in this repository to fetch and extract the signature. Only
`bash`, `wget` and `pesign` tools are required.

## Contributing

Feel free to file a Pull Request if there are new versions of RHEL released, I
will do my best to update this git repository regularly.

## License

This is PUBLIC DOMAIN.
